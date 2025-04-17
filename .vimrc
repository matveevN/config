
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set number
set cursorline
set hlsearch
set backspace=indent,eol,start
set mouse=a
set ignorecase
set belloff=all
set hidden 
set expandtab
set smarttab
set tabstop=8
set shiftwidth=8
set laststatus=2
set nobackup
set nowritebackup
set updatetime=300

nmap <C-f> :Files<CR>
inoremap {<CR> {<CR>}<Esc>ko

highlight CursorLine cterm=underline ctermbg=None 
highlight CursorLine gui=underline  

let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-clangd',
  \ 'coc-python'
  \ ]

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
autocmd BufWritePost *.cpp,*.h silent! !clang-format -i %

