local present, lspconfig, cmp_lsp

present, lspconfig = pcall(require, "lspconfig")
if not present then
    return
end

present, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not present then
    return
end

vim.lsp.set_log_level("trace")
require("vim.lsp.log").set_format_func(vim.inspect)

local capabilities = cmp_lsp.default_capabilities()

local function on_attach(_, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = {
        buffer = bufnr,
        noremap = true,
        silent = true,
    }

    local function nmap(kb, ...)
        vim.keymap.set("n", kb, ..., opts)
    end

    nmap("gD",        vim.lsp.buf.decleration)
    nmap("gd",        vim.lsp.buf.definition)
    nmap("K",         vim.lsp.buf.hover)
    nmap("gi",        vim.lsp.buf.implementation)
    nmap("<C-k>",     vim.lsp.buf.signature_help)
    nmap("<Space>wa", vim.lsp.buf.add_workspace_folder)
    nmap("<Space>wr", vim.lsp.buf.remove_workspace_folder)
    nmap("<Space>wl", vim.lsp.buf, function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
    nmap("<Space>D",  vim.lsp.buf.type_definition)
    nmap("<Space>rn", vim.lsp.buf.rename)
    nmap("gr",        vim.lsp.buf.references)
    nmap("<Space>e",  vim.diagnostic.open_float)
    nmap("[d",        vim.diagnostic.goto_prev)
    nmap("]d",        vim.diagnostic.goto_next)
    nmap("<Space>q",  vim.diagnostic.setloclist)
end

--[[
lspconfig["clangd"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
})
]]

--[[
lspconfig["gopls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
})
]]

--[[
lspconfig["hls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "cabal", "haskell", "lhaskell" },
})
]]

--[[
lspconfig["jdtls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "java" },
})
]]

--[[
lspconfig["kotlin_language_server"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "kotlin" },
})
]]

lspconfig["lua_ls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "lua" },
})

--[[
lspconfig["nim_langserver"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "nim" },
})
]]

--[[
lspconfig["ocamllsp"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
        "ocaml", "ocaml.menhir", "ocaml.interface",
        "ocaml.ocamllex", "reason", "dune",
    },
})
]]

--[[
lspconfig["ols"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "odin" },
})
]]

--[[
lspconfig["phpactor"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "php" },
})
]]

--[[
lspconfig["pylsp"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
})
]]

--[[
lspconfig["r_language_server"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "r", "rmd" },
})
]]

--[[
lspconfig["rome"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
        "javascript", "javascriptreact", "json",
        "typescript", "typescript.tsx", "typescriptreact",
    },
})
]]

--[[
lspconfig["rust_analyzer"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "rust" },
})
]]

--[[
lspconfig["sorbet"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "ruby" },
})
]]

--[[
lspconfig["sqlls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "sql", "mysql" },
})
]]

--[[
lspconfig["vls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "v", "vlang" },
})
]]

--[[
lspconfig["yamlls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "yaml", "yaml.docker-compose" },
})
]]

--[[
lspconfig["zls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "zig", "zir" },
})
]]
