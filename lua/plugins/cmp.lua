local present, cmp, luasnip

present, cmp = pcall(require, "cmp")
if not present then
    return
end

present, luasnip = pcall(require, "luasnip")
if not present then
    return
end

cmp.setup({
    completion = {
        completeopt = "menu,menuone",
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
    }),
})
