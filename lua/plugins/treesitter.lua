local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

local function disable_large(lang, buf)
    -- 100 KiB
    local max_filesize = 100 * 1024
    local ok, tats = pcall(
        vim.loop.fs_stat,
        vim.api.nvim_buf_get_name(buf)
    )

    if ok and stats and stats.size >= max_filesize then
        return true
    end

    return false
end

treesitter.setup({
    ensure_installed = {
        "c", "lua", "vim", "vimdoc",
    },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,

        -- Disable highlighting for large files
        disable = disable_large,
    },
})
