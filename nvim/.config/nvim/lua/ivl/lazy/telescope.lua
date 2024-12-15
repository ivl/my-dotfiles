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
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope Find Files" })
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Telescope Find Keymaps" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope Live Grep" })
            vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "Telescope Find Text" })
            vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = "" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope Find Buffer" })
            vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = "Telescope Find Marks" })
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Telescope Find Diagnostics" })
            vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "Telescope Find Resume" })
            vim.keymap.set('n', '<leader>fl', builtin.loclist, { desc = "Telescope Find Location List" })
            vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = "Telescope Find Quickfix List" })
            vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = "Telescope Find Old Files" })
            vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = "Telescope Find Registers" })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope Find Help Tags" })
            vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "" })
            vim.keymap.set('n', '<leader>fs', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
            vim.keymap.set('n', '<leader>fn', function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = "Telescope Find Config Files" })
            vim.keymap.set("n", "<leader>feg", function()
                require("ivl.modules.telescope_extensions").live_multigrep()
            end, { desc = "Live Multi Grep" })
        end
    }
}
