
"        ___
" |\ |\  /| |\/|
" | \| \/_|_|  |
"

mapclear
" vim-plugs {{{

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'bpstahlman/txtfmt'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}
Plug 'jparise/vim-graphql'
Plug 'dylanaraps/wal.vim'
call plug#end()

" }}}


" augroups {{{

"augroup indents
"	autocmd!
"	autocmd FileType less,css,html setlocal ts=2 sts=2 sw=2 expandtab
"	autocmd FileType text,markdown setlocal expandtab
"	autocmd FileType python setlocal ts=4 sts=4 sw=4 noexpandtab
"augroup END

augroup Limelight
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!
augroup END

augroup highlight_follows_focus
	autocmd!
	autocmd WinEnter * set nocursorline
	autocmd WinLeave * set nocursorline
augroup END

au BufNewFile,BufRead *.handlebars set filetype=html



augroup highlight_follows_vim
	autocmd!
	autocmd FocusGained * set nocursorline
	autocmd FocusLost * set nocursorline
augroup END

augroup mapppings
	autocmd!
	autocmd FileType less,css,html nnoremap <Leader>s viB:sort<cr>
augroup END

augroup restorecursor
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   execute "normal! g`\"" |
		\ endif
augroup END

augroup nerdtree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

augroup startify
        autocmd User Startified let &l:stl = ' welcome to neovim motherfucker!'
augroup END
" }}}


" general settings {{{

set nobackup
set nowritebackup
set noswapfile " get rid of swapfiles everywhere
set dir=/tmpset

syntax on

set mps+=<:> 
set list
filetype indent on
set number
set laststatus=2
set nowrap
set noshowcmd
set noshowmode
set nocursorline
set listchars=tab:│\ ,nbsp:␣,trail:∙,extends:>,precedes:<
set fillchars+=vert:.
set scrolloff=12
set ignorecase
set smartcase
set sidescroll=40
set incsearch
set hlsearch
set undofile
set undodir=~/.vim/undodir
set path+=**
set inccommand=split
set backspace=indent,eol,start
set hidden
set wildmenu
set foldmethod=manual
set splitbelow
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

"set termguicolors

syntax enable
colorscheme wal

let g:limelight_conceal_ctermfg = 1

let g:startify_padding_left = 10
let g:startify_bookmarks = [ '~/dots/neovim/.config/nvim/init.vim','~/.config/', '~/dots/zsh/.zshrc', '~/dots/xconfs/.Xresources', '~/dots/termite/.config/termite/config', '~/dots/bspwm/.config/bspwm/bspwmrc', '~/dots/sxhkd/.config/sxhkd/sxhkdrc'  ]
let g:startify_lists = [
    \ { 'type': 'files',        'header': [ '  Recent']        },
    \ { 'type': 'bookmarks',    'header': [ '  Bookmarks']     },
    \]

set shiftwidth=2   " indent = 4 spaces
set expandtab      " tabs are tabs
"set tabstop=4      " tab = 4 spaces
set softtabstop=2  " backspace through spaces
set smarttab
" }}}

" statusline {{{

let g:currentmode={
    \ 'n'  : 'N ',
    \ 'no' : 'n·operator pending ',
    \ 'v'  : 'V ',
    \ 'V'  : 'VL ',
    \ '' : 'VB ',
    \ 's'  : 'select ',
    \ 'S'  : 's·line ',
    \ '' : 's·block ',
    \ 'i'  : 'I ',
    \ 'R'  : 'replace ',
    \ 'Rv' : 'v·replace ',
    \ 'c'  : 'CMD ',
    \ 'cv' : 'vim ex ',
    \ 'ce' : 'ex ',
    \ 'r'  : 'prompt ',
    \ 'rm' : 'more ',
    \ 'r?' : 'confirm ',
    \ '!'  : 'shell ',
    \ 't'  : 'terminal '}


set statusline=%3*
set statusline+=%3*\ %#PrimaryBlock#
set statusline+=%3*\%{g:currentmode[mode()]}
set statusline+=%1*\%#SecondaryBlock#
set statusline+=%1*\%#TeritaryBlock#
set statusline+=%2*\ %f\ 
set statusline+=%4*\%M\ 
set statusline+=%1*\%#TeritaryBlock#
set statusline+=%1*\%=
set statusline+=%1*\%#SecondaryBlock#
set statusline+=%1*\%#PrimaryBlock#
set statusline+=%4*\ %P\ 

hi User1           ctermfg=2 ctermbg=0
hi User2           ctermfg=3 ctermbg=0
hi User3           ctermfg=4 ctermbg=0 gui=bold
hi User4           ctermfg=2 ctermbg=0
hi StatusLine      ctermfg=0 ctermbg=1
hi StartifyHeader  ctermfg=3
hi StartifyPath    ctermfg=6
hi StartifyFile    ctermfg=5
hi StartifyBracket ctermfg=5
hi StartifyNumber  ctermfg=3
hi StartifySection ctermfg=3


" functions {{{


let g:help_in_tabs = 1

nmap <silent> H  :let g:help_in_tabs = !g:help_in_tabs<CR>

"Only apply to .txt files...
augroup HelpInTabs
	autocmd!
	autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
	if &buftype == 'help' && g:help_in_tabs
		"Convert the help window to a tab...
		execute "normal \<C-W>T"
	endif
endfunction
" }}}

let NERDTreeShowHidden=1

" mappings {{{

let mapleader=' '

" nnoremap {{{
nnoremap <Leader>o : only<cr>
nnoremap <Leader>l : Lines<cr>
nnoremap <Leader>f : NERDTreeFind ~/.<cr>
nnoremap <Leader>z : tabnew<cr>
nnoremap <Leader>w : MtaJumpToOtherTag<cr>
nnoremap <Leader>n : tabnext<cr>
nnoremap <Leader>N : tabprevious<cr>
nnoremap <F2>      : NERDTreeToggle<cr>
nnoremap <Leader><ESC> : nohlsearch<cr>
nnoremap H H:exec 'norm! '. &scrolloff . 'k'<cr>
nnoremap L L:exec 'norm! '. &scrolloff . 'j'<cr>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}

cmap w!! %!sudo tee > /dev/null %

" vnoremap {{{
vnoremap > >gv
vnoremap < <gv
" }}}

" onoremap {{{
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap ax a`
onoremap ix i`
" }}}

" xnoremap {{{
xnoremap + g<C-a>
xnoremap - g<C-x>
" }}}

" I always linger on the shift key
:command! WQ wq
:command! Wq wq
:command! Wqa wqa
:command! W w
:command! Q q

" abbreviations
iab #i #include
iab #d #define
iab #r require(

cab dst put =strftime('%d %a, %b %Y')<cr>
cab vg vimgrep
" }}}
" plugin settings {{{


" nerdtree {{{
let g:NERDTreeMinimalUI  = 1
let g:NERDTreeWinPos     = 'right'
let g:NERDTreeStatusline = 0
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" }}}


autocmd User Startified setlocal cursorline

    let g:startify_enable_special      = 0
    let g:startify_files_number        = 8
    let g:startify_relative_path       = 1
    let g:startify_change_to_dir       = 1
    let g:startify_update_oldfiles     = 1
    let g:startify_session_autoload    = 1
    let g:startify_session_persistence = 1
    let g:startify_custom_header = 'startify#fortune#boxed()'
    let g:startify_custom_header = [
          \'             \__    __/          ',
          \'             /_/ /\ \_\          ',
          \'            __ \ \/ / __         ',
          \'            \_\_\/\/_/_/         ',
          \'        __/\___\_\/_/___/\__     ',
          \'          \/ __/_/\_\__ \/       ',
          \'            /_/ /\/\ \_\         ',
          \'             __/ /\ \__          ',
          \'             \_\ \/ /_/          ',
          \'             /        \          '
	    \ ]

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
let g:WebDevIconsOS = 'Linux'
" }}}
