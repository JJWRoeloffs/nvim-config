vim.cmd([[
    let g:lightline = {
        \ 'colorscheme': 'lena',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'filetype' ] ]
        \ },
        \ 'inactive': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead'
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
