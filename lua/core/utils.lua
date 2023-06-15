-- Helper functions
local function set_keymap(mode, kb, cmd)
    vim.api.nvim_set_keymap(mode, kb, cmd, { noremap=true })
end

local function imap(kb, cmd)
    set_keymap("i", kb, cmd)
end

local function map(kb, cmd)
    set_keymap("", kb, cmd)
end

local function nmap(kb, cmd)
    set_keymap("n", kb, cmd)
end

local function vmap(kb, cmd)
    set_keymap("v", kb, cmd)
end

return {
    imap = imap,
    map = map,
    nmap = nmap,
    vmap = vmap,
}
