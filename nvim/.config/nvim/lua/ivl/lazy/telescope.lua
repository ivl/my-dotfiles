return {
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
            vim.keymap.set('n', '<leader>ft', builtin.builtin, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fm', builtin.marks, {})
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
            vim.keymap.set('n', '<leader>fr', builtin.resume, {})
            vim.keymap.set('n', '<leader>fl', builtin.loclist, {})
            vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
            vim.keymap.set('n', '<leader>f.', builtin.oldfiles, {})
            vim.keymap.set('n', '<leader>fr', builtin.registers, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>fs', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    }

}
