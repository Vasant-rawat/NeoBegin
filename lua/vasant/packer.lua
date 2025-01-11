vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
-- or                            , branch = '0.1.x',
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  requires = { {'nvim-lua/plenary.nvim'} }
}

--for colorScheme
use({ 
	'rose-pine/neovim',
	as = 'rose-pine' 
 ,config = function()
		vim.cmd('colorscheme rose-pine')
  	end
})
use('nvim-treesitter/nvim-treesitter', {run =':TSUpdate'})
use("nvim-treesitter/playground")
use("ThePrimeagen/harpoon")
use("mbbill/undotree")
use("tpope/vim-fugitive")

---mason is used for installing lsp easily
use {
    "williamboman/mason.nvim"
}
-- For lsp(basically for auto compelition of code in simple words)
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    requires = {
        -- LSP Support
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'neovim/nvim-lspconfig'},
        
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'L3MON4D3/LuaSnip'},
    }
}
end)
