local function setup()
    vim.cmd([[
    hi SignifyLineAdd             ctermfg=green      ctermbg=NONE
    hi SignifyLineChange          ctermfg=yellow     ctermbg=NONE
    hi SignifyLineChangeDelete    ctermfg=yellow     ctermbg=NONE
    hi SignifyLineDelete          ctermfg=red        ctermbg=NONE
    hi SignifyLineDeleteFirstLine ctermfg=red        ctermbg=NONE

    hi SignifySignAdd             ctermfg=green      ctermbg=NONE
    hi SignifySignChange          ctermfg=yellow     ctermbg=NONE
    hi SignifySignChangeDelete    ctermfg=yellow     ctermbg=NONE
    hi SignifySignDelete          ctermfg=red        ctermbg=NONE
    hi SignifySignDeleteFirstLine ctermfg=red        ctermbg=NONE

    let g:signify_sign_add               = '│'
    let g:signify_sign_delete            = '_'
    let g:signify_sign_delete_first_line = '‾'
    let g:signify_sign_change            = '│'
    let g:signify_sign_change_delete     = g:signify_sign_change . g:signify_sign_delete_first_line
    ]])
end

return {
    "mhinz/vim-signify",
    config = setup,
}
