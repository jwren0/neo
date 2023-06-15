local autocmd = vim.api.nvim_create_autocmd

-- Trim trailing whitespace on write
autocmd("BufWritePre", {
    pattern = "*",
    command = ":s/\\s\\+$//e",
})

-- Custom indentation
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "css", "html", "rb", "txt" },
    command = "setlocal expandtab shiftwidth=2 tabstop=2",
})

autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "Makefile",
    command = "setlocal noexpandtab shiftwidth=8 tabstop=8",
})

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
    2match none
    setlocal nonumber norelativenumber nospell statusline=Terminal
    startinsert
    ]],
})

autocmd("TermClose", {
   pattern = "*",
   command = [[
   match LongLines /\%>72v.\+/
   2match ExtraWhitespace /\s\+$/

   if !v:event.status
       exe 'bdelete! ' .. expand('<abuf>')
   endif
   ]],
})

-- Useful highlighting
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*",
    command = [[
    highlight LongLines ctermbg=red ctermfg=black guibg=red guifg=black
    match LongLines /\%>72v.\+/

    highlight ExtraWhitespace ctermbg=red ctermfg=black
    highlight ExtraWhitespace guibg=red guifg=black
    2match ExtraWhitespace /\s\+$/
    ]],
})
