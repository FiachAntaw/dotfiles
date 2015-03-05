set nocompatible

" Set up Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-fugitive'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'chriskempson/base16-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'edkolev/tmuxline.vim'

call vundle#end()
filetype plugin indent on

" Enable base16 colours
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
let base16colorspace=256
silent! colorscheme base16-default

" Enable ctrl-P mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Enable smart tabline
let g:airline#extensions#tabline#enabled = 1

" Enable powerline symbols
let g:airline_powerline_fonts = 1

" Configure tmuxline
let g:tmuxline_preset = {
    \'a'        : '#S',
    \'b'        : '#W',
    \'c'        : '',
    \'win'      : '#I #W',
    \'cwin'     : '#I #W#F',
    \'x'        : '#I:#P',
    \'y'        : '%R',
    \'z'        : '#h'}

" Disable pymode linter (use Syntactic instead)
let g:pymode_lint = 0

" Disable pymode autocomplete on dot
let g:pymode_rope_complete_on_dot = 0

" Syntactic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_c_compiler_options = '-std=c11'
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_python_python_exec = 'python3'

" Set up leader & hotkeys
let mapleader=","
nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>gg :Git
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gm :Gmove<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gD :Gdiff
nmap <Leader><Tab> :bnext<CR>
nmap <Leader><S-Tab> :bprevious<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :bd<CR>

