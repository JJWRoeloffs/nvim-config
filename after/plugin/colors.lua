-- TODO this should get highlighted

vim.cmd([[
  augroup lena_colors
  " lena.vim - Vim color scheme for 16-color terminals, heavily based on noctu
  " elenapan @ github
  " ------------------------------------------------------------------

  " Scheme setup {{{
  set background=dark
  let g:colors_name = "lena"

  "}}}
  " Vim UI {{{
  hi Normal              ctermfg=7
  hi Cursor              ctermfg=7     ctermbg=1
  hi CursorLine          ctermbg=0     cterm=NONE
  hi MatchParen          ctermfg=7     ctermbg=NONE  cterm=underline
  hi Pmenu               ctermfg=15    ctermbg=0
  hi PmenuThumb          ctermbg=7
  hi PmenuSBar           ctermbg=8
  hi PmenuSel            ctermfg=0     ctermbg=4
  hi ColorColumn         ctermbg=0
  hi SpellBad            ctermfg=1     ctermbg=NONE  cterm=underline
  hi SpellCap            ctermfg=12    ctermbg=NONE  cterm=underline
  hi SpellRare           ctermfg=11    ctermbg=NONE  cterm=underline
  hi SpellLocal          ctermfg=13    ctermbg=NONE  cterm=underline
  hi NonText             ctermfg=8
  hi LineNr              ctermfg=8     ctermbg=NONE  cterm=bold
  hi CursorLineNr        ctermfg=14    ctermbg=NONE     cterm=bold
  hi Visual              ctermfg=0     ctermbg=5
  hi IncSearch           ctermfg=0     ctermbg=13    cterm=NONE
  hi Search              ctermfg=0     ctermbg=14
  hi StatusLine          ctermfg=5     ctermbg=0     cterm=NONE
  hi StatusLineNC        ctermfg=8     ctermbg=0     cterm=bold
  hi VertSplit           ctermfg=13    ctermbg=NONE     cterm=bold
  hi TabLine             ctermfg=8     ctermbg=0     cterm=NONE
  hi TabLineSel          ctermfg=7     ctermbg=0
  hi Folded              ctermfg=4     ctermbg=0     cterm=bold,italic
  hi Conceal             ctermfg=6     ctermbg=NONE
  hi Directory           ctermfg=10    ctermbg=NONE  cterm=NONE
  hi Title               ctermfg=11    ctermbg=NONE  cterm=bold
  hi ErrorMsg            ctermfg=9     ctermbg=NONE     cterm=bold
  hi DiffAdd             ctermfg=0     ctermbg=2
  hi DiffChange          ctermfg=0     ctermbg=3
  hi DiffDelete          ctermfg=0     ctermbg=1
  hi DiffText            ctermfg=0     ctermbg=11    cterm=bold
  hi User1               ctermfg=1     ctermbg=0
  hi User2               ctermfg=2     ctermbg=0
  hi User3               ctermfg=4     ctermbg=0
  hi User4               ctermfg=3     ctermbg=0
  hi User5               ctermfg=5     ctermbg=0
  hi User6               ctermfg=6     ctermbg=0
  hi User7               ctermfg=7     ctermbg=0
  hi User8               ctermfg=8     ctermbg=0
  hi User9               ctermfg=15    ctermbg=5
  hi! link CursorColumn  CursorLine
  hi! link SignColumn    LineNr
  hi! link WildMenu      Visual
  hi! link FoldColumn    SignColumn
  hi! link WarningMsg    ErrorMsg
  hi! link MoreMsg       Title
  hi! link Question      MoreMsg
  hi! link ModeMsg       MoreMsg
  hi! link TabLineFill   StatusLineNC
  hi! link SpecialKey    NonText

  "}}}
  " Generic syntax {{{
  hi Delimiter       ctermfg=7
  hi Comment         ctermfg=8   cterm=bold
  hi Underlined      ctermfg=2   cterm=underline
  hi Type            ctermfg=2
  hi String          ctermfg=1  cterm=bold
  hi Keyword         ctermfg=4
  hi Todo            ctermfg=11  ctermbg=NONE     cterm=bold,underline
  hi Urgent          ctermfg=1   ctermbg=NONE     cterm=bold,underline
  hi Done            ctermfg=4   ctermbg=NONE     cterm=bold,underline
  hi Function        ctermfg=2
  hi Identifier      ctermfg=7   cterm=NONE
  hi Statement       ctermfg=4   cterm=bold
  hi Constant        ctermfg=13
  hi Number          ctermfg=10
  hi Boolean         ctermfg=2
  hi Special         ctermfg=13
  hi Ignore          ctermfg=0
  hi PreProc         ctermfg=8   cterm=bold
  hi Operator        ctermfg=5   cterm=bold
  " hi! link Operator  Delimiter
  hi! link Error     ErrorMsg

  "}}}
  " Git {{{
  hi gitCommitBranch               ctermfg=3
  hi gitCommitSelectedType         ctermfg=12
  hi gitCommitSelectedFile         ctermfg=4
  hi gitCommitUnmergedType         ctermfg=9
  hi gitCommitUnmergedFile         ctermfg=1
  hi! link gitCommitFile           Directory
  hi! link gitCommitUntrackedFile  gitCommitUnmergedFile
  hi! link gitCommitDiscardedType  gitCommitUnmergedType
  hi! link gitCommitDiscardedFile  gitCommitUnmergedFile
  "}}}
augroup END
]])
