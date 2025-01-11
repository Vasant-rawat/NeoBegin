local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    -- Define an auxiliary function for setting buffer-local keymaps
    local function buf_set_keymap(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- LSP actions
    buf_set_keymap('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
    buf_set_keymap('n', 'gr', vim.lsp.buf.references, { desc = "Go to references" })
    buf_set_keymap('n', 'K', vim.lsp.buf.hover, { desc = "Hover information" })
    buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename" })
    buf_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
    buf_set_keymap('n', '<leader>f', vim.lsp.buf.format, { desc = "Format code" })
    -- Diagnostic keymaps
    buf_set_keymap('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
    buf_set_keymap('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
    buf_set_keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
    buf_set_keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })
end)

-- Configure language servers
require('lspconfig').lua_ls.setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').jdtls.setup({
    cmd = { 'jdt-language-server', '-data', vim.fn.stdpath('data') .. '/jdtls' },
    root_dir = require('lspconfig').util.root_pattern('.git', 'mvnw', 'pom.xml', 'gradlew', 'gradle',
        'settings.gradle'),
    settings = {
        java = {
            signatureHelp = {
                enabled = true,
            },
            contentAssist = {
                enabled = true,
            },
            format = {
                enabled = true,
            },
            completion = {
                enabled = true,
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
        },
    },
})

-- Configure nvim-cmp
local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        -- Add other sources as needed
    },
})

-- Initialize lsp-zero
lsp_zero.setup({
    languages = {
        java = {
            lsp = {
                jdtls = {},
            },
        },
    },
})
