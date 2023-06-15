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

lspconfig["lua_ls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "lua" },
})
