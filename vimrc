syntax on
set nocp
set autoindent smartindent
set autowrite nobackup
set backspace=indent,eol,start
set clipboard=unnamed
set hlsearch ignorecase smartcase incsearch nowrapscan
set nowrap
set showcmd ruler
set showmatch
set smarttab expandtab shiftwidth=4 tabstop=4
set list listchars=tab:>-,trail:-
"set relativenumber numberwidth=3
set modeline modelines=5

nnoremap <space> <c-f>
nnoremap <leader>ev :vs$MYVIMRC<cr>
nnoremap <leader>sv :so$MYVIMRC<cr>
nnoremap <leader>r :exe getline(1)[1:] @%<cr>
nnoremap <leader>t :!tctest %<cr>

filetype plugin on

" restore cursor position
"au BufReadPost * norm g`"
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

