call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'


Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons' 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Цветные иконки:

call plug#end()


" Открытие и закрытие NERDTree с помощью Ctrl + N
nnoremap <C-n> :NERDTreeToggle<CR>
" Закрытие NERDTree, если оно последнее окно
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && &filetype == 'nerdtree' | quit | endif



set number
set guicursor=
set relativenumber
set statuscolumn=%s\ %l\ %r\ \   
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
set laststatus=3
set nobackup
set nowritebackup
set updatetime=300
set nowrap
syntax on
set termguicolors " для tmux цвет vim надо
colorscheme tango 


"inoremap {<CR> {<CR>}<Esc>ko

highlight CursorLine cterm=underline ctermbg=None 
highlight CursorLine gui=underline  

let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-vimtex'
\ ]


" Бинды для DAP
nnoremap <F5> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <F9> :lua require'dap'.continue()<CR>
nnoremap <F10> :lua require'dap'.step_over()<CR>
nnoremap <F11> :lua require'dap'.step_into()<CR>
nnoremap <F12> :lua require'dap'.step_out()<CR>

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

" Бинды для Telescope
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <C-g> <cmd>Telescope live_grep<cr>

" Telescope fzf plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF



lua << EOF
local dap = require("dap")

-- Настройка адаптера GDB
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

-- Конфигурации для C и C++
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
       local name = vim.fn.input('Executable name (filter): ')
       return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = '${workspaceFolder}'
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'gdb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  },
}

EOF


lua << EOF
local dap = require("dap")
local dapui = require("dapui")

-- Настройки dap-ui
dapui.setup()

-- Автоматически открывать/закрывать DAP UI при запуске/остановке сессий
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
EOF

lua require('my_modules.cowboy').cowboy()




nmap te :tabedit<CR>

nmap <Tab> :tabnext<CR>

nmap <S-Tab> :tabprev<CR>





" Split window
nnoremap ss :split<Return>
nnoremap sv :vsplit<Return>

" Move window
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l

