function ColorMyPencils(color)
    color = color or "rose-pine"
    -- Apply the colorscheme
    local success, _ = pcall(vim.cmd.colorscheme, color)
    if not success then
        print("Colorscheme " .. color .. " not found!")
        return
    end

    -- Optional: Set transparent background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.opt.termguicolors = true -- Ensure true color support
print("ColorMyPencils was called")
ColorMyPencils("rose-pine")
