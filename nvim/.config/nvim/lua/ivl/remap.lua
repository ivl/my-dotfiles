vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap('x', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

--- force yourself not to use the keys
vim.keymap.set({ "", "!" }, "<Right>", "", {})
vim.keymap.set({ "", "!" }, "<Left>", "", {})
vim.keymap.set({ "", "!" }, "<Up>", "", {})
vim.keymap.set({ "", "!" }, "<Down>", "", {})

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Next Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Previouse Diagnostic" })

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

vim.api.nvim_create_autocmd('LspAttach', {

    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts, { desc = "LSP Goto Decalaration" })
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts, { desc = "LSP Goto Definition" })
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts, { desc = "LSP References" })
        vim.keymap.set("n", "rn", function() vim.lsp.buf.rename() end, opts, { desc = "LSP Rename" })
        vim.keymap.set("n", "ca", function() vim.lsp.buf.code_action() end, opts, { desc = "LSP Code Action" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts, { desc = "LSP Hoover" })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts, { desc = "LSP Signature help" })
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
