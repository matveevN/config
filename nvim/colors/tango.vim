set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
 
let g:colors_name = "tango"
 
if exists("g:bg_tango") && g:bg_tango == 1
    highlight Normal gui=none guifg=#eeeeec guibg=#2e3436
else
    highlight Normal gui=none guifg=#eeeeec guibg=#000000
endif
 
" Search
highlight IncSearch gui=underline guifg=#555753 guibg=#fce94f
highlight Search gui=none guifg=#555753 guibg=#fce94f

" Messages
highlight ErrorMsg gui=bold guifg=#eeeeec guibg=#cc0000
highlight WarningMsg gui=bold guifg=#eeeeec guibg=#cc0000
highlight ModeMsg gui=bold guifg=#eeeeec guibg=bg
highlight MoreMsg gui=none guifg=#204a87 guibg=bg
highlight Question gui=none guifg=#4e9a06 guibg=bg
 
" Split area
highlight StatusLine gui=none guifg=#000000 guibg=#ffffff " Белая полоска статуса с черным текстом
highlight StatusLineNC gui=none guifg=#555753 guibg=#ffffff
highlight VertSplit gui=none guifg=#d3d7cf guibg=#204a87
highlight WildMenu gui=none guifg=#eeeeec guibg=#2e3436
 
" Diff
highlight DiffText gui=bold guifg=#eeeeec guibg=#ad7fa8
highlight DiffChange gui=none guifg=bg guibg=#ad7fa8
highlight DiffDelete gui=none guifg=bg guibg=#2e3436
highlight DiffAdd gui=none guifg=#3465a4 guibg=#2e3436
 
" Cursor
highlight Cursor gui=none guifg=#eeeeec guibg=#729fcf
highlight MatchParen gui=bold guifg=#eeeeec guibg=#ce5c00
" Убираем подсветку строки
highlight CursorLine gui=none guibg=none

 
" Fold
highlight Folded gui=none guifg=#555753 guibg=#2e3436
highlight FoldColumn gui=none guifg=#888a85 guibg=#2e3436
 
" Popup Menu
highlight PMenu guifg=#eeeeec guibg=#555753
highlight PMenuSel guifg=#eeeeec guibg=#2e3436
highlight PMenuSBar guifg=#eeeeec guibg=#2e3436
highlight PMenuThumb guifg=#eeeeec guibg=#2e3436
 
" Other
highlight Directory gui=none guifg=#204a87 guibg=bg
highlight LineNr gui=none guifg=#af5f00 guibg=#000000 " Коричневые номера строк (#af5f00)
highlight NonText guifg=#000000 guibg=#000000
highlight SpecialKey gui=none guifg=#75507b guibg=bg
highlight Title gui=bold guifg=#3465a4 guibg=bg
highlight Visual gui=none guifg=#383838 guibg=#a8a8a8
 
" Syntax group
highlight Comment gui=none guifg=#3364a2 guibg=bg " Цвет комментариев (#3364a2)
highlight Constant gui=bold guifg=#cc0000 guibg=bg
highlight Error gui=none guifg=#a40000 guibg=bg
highlight SpellBad term=underline gui=undercurl guisp=#ffffff
highlight Identifier gui=none guifg=#3465a4 guibg=bg
highlight Ignore gui=none guifg=bg guibg=bg
highlight PreProc gui=none guifg=#75507b guibg=bg
highlight Special gui=none guifg=#75507b guibg=bg
highlight Statement gui=none guifg=#af5f00 guibg=bg " Цвет ключевых слов (#af5f00)
highlight Todo gui=bold guifg=#ef2929 guibg=bg
highlight Type gui=none guifg=#4e9a06 guibg=bg
highlight Underlined gui=none guifg=#3465a4 guibg=bg
highlight String gui=none guifg=#a40000 guibg=bg
highlight Number gui=none guifg=#cc0000 guibg=bg

