call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

set nocp
set autowrite nobackup
set nowrap nowrapscan
set showmatch showcmd ruler
set hlsearch incsearch
set ignorecase smartcase smartindent smarttab
set expandtab shiftwidth=4 tabstop=4 softtabstop=4
set list listchars=tab:>-,trail:-
set backspace=indent,eol,start
set clipboard=unnamed,unnamedplus
set modeline modelines=5
"set relativenumber numberwidth=3

"let g:tagbar_ctags_bin = expand('~/opt/ctags/bin/ctags')
"let g:easytags_cmd     = expand('~/opt/ctags/bin/ctags')
set tags=./tags;
set runtimepath^=expand(~/.vim/bundle/vim-erlang-tags)

"let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_dynamic_files = 1

let g:vim_markdown_folding_disabled = 1

let g:go_fmt_autosave = 0

let g:ctrlp_map = '' "'<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files', 'find %s -type f']

let g:erlang_quickfix_support = 0

augroup erlang
    au!
    au FileType erlang let g:easytags_cmd = expand('~/.vim/bundle/vim-erlang-tags/bin/vim-erlang-tags.erl')
augroup END

augroup html
    au!
    au BufNewFile,BufRead *.html setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

nnoremap <space> <c-f>
nnoremap <leader>ev :vs$MYVIMRC<cr>
nnoremap <leader>sv :so$MYVIMRC<cr>
nnoremap <leader>r :exe getline(1)[1:] @%<cr>
"nnoremap <leader>t :!tctest %<cr>
nnoremap <leader>q :s/"/'/g<cr>:noh<cr>

augroup go
    au!
    au FileType go nnoremap <leader>r :GoRun<cr>
augroup END

" restore cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  "autocmd BufWinEnter * call ResCur()
  autocmd BufReadPost * call ResCur()
augroup END

if has('gui_running')
    colorscheme torte
    set columns=80
    "set guifont=Monaco:h24
    set guifont=Monospace\ 18
    set lines=24
endif

hi Comment ctermfg=LightCyan

nnoremap <c-p> :FZF<cr>
let g:fzf_command_prefix = 'Fzf'

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"noremap <c-k> :Ack '\b<c-r><c-w>\b'<cr>
noremap <c-k> :Ack '\b<cword>\b'<cr><c-w><c-w>zz
noremap <c-n> :cn<cr>zz<c-w>wzz<c-w>w
noremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>
