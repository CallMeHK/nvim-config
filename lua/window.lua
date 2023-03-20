
vim.api.nvim_create_autocmd("WinEnter", {
    -- pattern = { "*" },
    command = "set cursorline",
})


vim.api.nvim_create_autocmd("WinLeave", {
    -- pattern = { "*" },
    command = "set nocursorline",
})

-- vim.cmd([[
-- "
-- highlight ColorColumn guibg=#17161D
-- if exists('+colorcolumn')
--   function! s:DimInactiveWindows()
--     for i in range(1, tabpagewinnr(tabpagenr(), '$'))
--       let l:range = ''
--       if i != winnr()
--         if &wrap
--          let l:width=256 
--         else
--          let l:width=winwidth(i)
--         endif
--         let l:range = join(range(1, l:width), ',')
--       endif
--       call setwinvar(i, '&colorcolumn', l:range)
--     endfor
--   endfunction
--   augroup DimInactiveWindows
--     au!
--     au WinEnter * call s:DimInactiveWindows()
--   augroup END
-- endif
-- "
-- ]])
