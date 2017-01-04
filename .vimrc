set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)


" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'majutsushi/tagbar'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kshenoy/vim-signature'
Plugin 'airblade/vim-gitgutter'
Plugin 'tomtom/tlib_vim'
Plugin 'fatih/vim-go'
Plugin 'evan176/preview-reg'


filetype plugin indent on     " required
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

" Set mapping shortcut for plugin


" <TagBar>
nmap <F3> :TagbarToggle<CR>


" <SuperTab>
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = '<C-j>'


" <YouCompleteMe>
set completeopt-=preview
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>'] 


" <UltiSnip>
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/bundle/vim-snippets/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-tab>"


" <NerdTree>
nmap <F2> :NERDTreeToggle<CR>


" <Syntastic>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=0
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_error_symbol = "X"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_c_checkers = ['/usr/bin/gcc']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:check_flag=1
function! SyntasticCheckOption()
    if g:check_flag
        SyntasticCheck
        Errors
        let g:check_flag=0
    else
        lclose
        let g:check_flag=1
    endif
endfunction
nnoremap <F4> :call SyntasticCheckOption()<CR>


" <Solarized colorscheme>
syntax enable
syntax on
set t_Co=16
set background=dark
colorscheme solarized


" <Airline>
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1


" <NerdCommenter>
let g:NERDSpaceDelims=1


" <Preview-reg>
nnoremap <leader>p :call SelectReg()<CR>  
nnoremap <leader>m :call SelectMark()<CR>


" <vim-go>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_play_open_browser = 0
let g:go_get_update = 0


" My custom setting
set number
set autoindent
set hlsearch
set incsearch
autocmd BufRead,BufNewFile *.py set softtabstop=4 shiftwidth=4
autocmd BufRead,BufNewFile *.sh set softtabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.h set softtabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.c set softtabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.cpp set softtabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.cc set softtabstop=2 shiftwidth=2
set expandtab
set cursorline
set mouse=a
if has('unnamedplus')
    set clipboard+=unnamed,unnamedplus
else
    set clipboard+=unnamed
endif
" Remap clipboard
nnoremap <C-v> "+p
vmap <C-c> "+y


" Remap Ctrl - W
nnoremap <C-k> <C-W><C-K>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>


" Remap Tab - W
nnoremap <S-Tab> :bnext<CR>


" Compile key
autocmd BufRead *.py nmap <F12> :w !python %<CR>
autocmd BufRead *.sh nmap <F12> :w !bash %<CR>
autocmd BufRead *.c nmap <F12> :!gcc --o "%:p:r.out" "%:p" && "%:p:r.out"<CR>
autocmd BufRead *.cpp nmap <F12> :!g++ -o "%:p:r.out" "%:p" && "%:p:r.out"<CR>
autocmd BufRead *.cc nmap <F12> :!g++ -o "%:p:r.out" "%:p" && "%:p:r.out"<CR>
autocmd FileType go nmap <F12> <Plug>(go-run)


" CompleteNewFile
autocmd bufnewfile *.py so /home/evan/.vim/header/python_header.txt
autocmd bufnewfile *.sh so /home/evan/.vim/header/shell_header.txt
autocmd bufnewfile *.h so /home/evan/.vim/header/c_h_header.txt
autocmd bufnewfile *.c so /home/evan/.vim/header/c_header.txt
autocmd bufnewfile *.cpp so /home/evan/.vim/header/c++_header.txt
autocmd bufnewfile *.cc so /home/evan/.vim/header/c++_header.txt
autocmd bufnewfile CMakeLists.txt so /home/evan/.vim/header/CMakeLists_header.txt
autocmd bufnewfile Makefile so /home/evan/.vim/header/make_header.txt


" [Shortcuts Mapping Table]
" F2            =   NerdTree
" F3            =   TagBar
" F4            =   SyntasticCheck
" F12           =   Compile code immediately
" Shift - Tab   =   Switch buffer
" Ctrl - p      =   CtrlP finding
" Ctrl - c      =   Copy to clipboard in visual mode
" Ctrl - v      =   paste from clipboard in normal mode
" \ p           =   Show register menu to paste
" \ m           =   Show marks menu to jump
" Ctrl - h      =   Move left
" Ctrl - l      =   Move right
" Ctrl - j      =   Move down
" Ctrl - k      =   Move up
" Tab           =   Youcompleteme & UltiSnips
