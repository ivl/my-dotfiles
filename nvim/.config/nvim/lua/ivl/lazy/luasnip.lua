return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexpl",
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local sn = ls.snippet_node
        local isn = ls.indent_snippet_node
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local c = ls.choice_node
        local d = ls.dynamic_node
        local r = ls.restore_node
        local events = require("luasnip.util.events")
        local ai = require("luasnip.nodes.absolute_indexer")
        local extras = require("luasnip.extras")
        local l = extras.lambda
        local rep = extras.rep
        local p = extras.partial
        local m = extras.match
        local n = extras.nonempty
        local dl = extras.dynamic_lambda
        local fmt = require("luasnip.extras.fmt").fmt
        local fmta = require("luasnip.extras.fmt").fmta
        local conds = require("luasnip.extras.expand_conditions")
        local postfix = require("luasnip.extras.postfix").postfix
        local types = require("luasnip.util.types")
        local parse = require("luasnip.util.parser").parse_snippet
        local ms = ls.multi_snippet
        local k = require("luasnip.nodes.key_indexer").new_key
        require("luasnip.loaders.from_vscode").load {}
        require("luasnip.loaders.from_vscode").load({ paths = "./ivl_snippets" })
        vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })
        ls.add_snippets("all", {
            s("trigger", {
                t({ "After expanding, the cursor is here ->" }), i(1),
                t({ "", "After jumping forward once, cursor is here ->" }), i(2),
                t({ "", "After jumping once more, the snippet is exited there ->" }), i(0),
            }) })

        ls.add_snippets("all", {
            s("trig", c(1, {
                t("Ugh boring, a text node"),
                { i(1), t("At least I can edit something now...") },
                f(function(args) return "Still only counts as text!!" end, {})
            })),
        })
        vim.keymap.set("i", "<C-k>", function() ls.change_choice(1) end, {
            silent = true })
        vim.keymap.set("s", "<C-k>", function() ls.change_choice(1) end, {
            silent = true })
        vim.keymap.set("i", "<C-j>", function() ls.change_choice(-1) end, { silent = true })
        vim.keymap.set("s", "<C-j>", function() ls.change_choice(-1) end, { silent = true })
    end,
}
