local function setup()
    vim.cmd([[
    function! MetalStatus() abort
      return get(g:, 'metals_status', '')
    endfunction

    let g:lightline = {
        \ 'colorscheme': 'lena',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'relativepath', 'modified', 'metals' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'filetype' ] ]
        \ },
        \ 'inactive': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'relativepath', 'modified', 'metals' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead',
        \   'metals': 'MetalStatus'
        \ },
        \ }

    let g:lightline.mode_map = {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'L',
        \ "\<C-v>": 'B',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'S-LINE',
        \ "\<C-s>": 'S-BLOCK',
        \ 't': 'T',
        \ }
]])
end

return {
    "itchyny/lightline.vim",
    dependencies = {
        { "tpope/vim-fugitive" },
    },
    config = setup,
}
