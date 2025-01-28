local colorApplied = false

function ColorMyPencils(color)

    if colorApplied then
        return
    end
    color = color or "kanagawa"
    vim.cmd("colorscheme kanagawa")
    print(color)
    local success, _ = pcall(vim.cmd.colorscheme, color)
    if not success then
        print("Colorscheme " .. color .. " not found!")
        return
    end
    colorApplied = true
end
vim.opt.termguicolors = true
print("ColorMyPencils was called")
ColorMyPencils("kanagawa")