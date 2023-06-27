local autocmd = vim.api.nvim_create_autocmd

-- Cleaner terminal
autocmd("WinEnter", {
    pattern = "*",
    command = [[
    try
        if !b:term_title
            startinsert
        endif
    catch /^Vim\%((\a\+)\)\=:E121:/
    endtry
    ]],
})

autocmd("TermOpen", {
    pattern = "*",
    command = [[
    match none
    setlocal nonumber norelativenumber nospell statusline=Terminal
    startinsert
    ]],
})

autocmd("TermClose", {
   pattern = "*",
   command = [[
   match ExtraWhitespace /\s\+$/

   if !v:event.status
       exe 'bdelete! ' .. expand('<abuf>')
   endif
   ]],
})

-- Useful highlighting
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*",
    command = [[
    highlight ExtraWhitespace ctermbg=red ctermfg=black
    highlight ExtraWhitespace guibg=red guifg=black
    match ExtraWhitespace /\s\+$/
    ]],
})
