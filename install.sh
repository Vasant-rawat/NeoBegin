#!/bin/bash

# Colors and symbols
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly RED='\033[0;31m'
readonly NC='\033[0m'
readonly CHECK_MARK="✓"
readonly CROSS_MARK="✗"
readonly ARROW="➜"

# Requirements
readonly REQUIRED_COMMANDS=(
    "git"
    "nvim"
    "npm"
    "node"
    "ripgrep"
)

# Progress indicator
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

print_message() {
    local color=$1
    local message=$2
    echo -e "${color}${ARROW} ${message}${NC}"
}

check_requirements() {
    print_message "$YELLOW" "Checking system requirements..."
    
    local missing_deps=()
    for cmd in "${REQUIRED_COMMANDS[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            missing_deps+=("$cmd")
        fi
    done
    
    if [ ${#missing_deps[@]} -ne 0 ]; then
        print_message "$RED" "Missing dependencies: ${missing_deps[*]}"
        print_message "$YELLOW" "Installing missing dependencies..."
        if [ -f "/etc/debian_version" ]; then
            sudo apt update && sudo apt install -y "${missing_deps[@]}"
        elif [ -f "/etc/arch-release" ]; then
            sudo pacman -Sy --noconfirm "${missing_deps[@]}"
        elif [ -f "/etc/fedora-release" ]; then
            sudo dnf install -y "${missing_deps[@]}"
        else
            print_message "$RED" "Unsupported distribution. Please install dependencies manually."
            exit 1
        fi
    fi
}

backup_existing_config() {
    if [ -d "$HOME/.config/nvim" ]; then
        print_message "$YELLOW" "Backing up existing Neovim configuration..."
        mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    fi
}

install_packer() {
    print_message "$YELLOW" "Installing Packer.nvim..."
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim &
    spinner $!
}

clone_config() {
    print_message "$YELLOW" "Cloning Neovim configuration..."
    git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim &
    spinner $!
}

install_plugins() {
    print_message "$YELLOW" "Installing plugins..."
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' &
    spinner $!
}

check_health() {
    print_message "$YELLOW" "Running health checks..."
    nvim --headless -c 'checkhealth' -c 'quit' > health_check.log 2>&1
    if grep -q "error" health_check.log; then
        print_message "$RED" "Some health checks failed. See health_check.log for details."
    else
        print_message "$GREEN" "Health checks passed! ${CHECK_MARK}"
        rm health_check.log
    fi
}

main() {
    print_message "$GREEN" "Starting Neovim configuration installation..."
    
    # Check system requirements
    check_requirements
    
    # Backup existing configuration
    backup_existing_config
    
    # Install components
    install_packer
    clone_config
    install_plugins
    
    # Post-installation health check
    check_health
    
    print_message "$GREEN" "Installation completed successfully! ${CHECK_MARK}"
    print_message "$YELLOW" "Please restart your terminal and run 'nvim' to start using your new configuration."
}

# Error handling with recovery suggestions
set -e
trap 'print_message "$RED" "Error occurred! Try:\n1. Remove ~/.local/share/nvim\n2. Remove ~/.config/nvim\n3. Run script again\nError details above."' ERR

# Run installation
main