
"        ___
" |\ |\  /| |\/|
" | \| \/_|_|  |
"

mapclear
" vim-plugs {{{

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim', { 'for': ['*html', '*css'] }
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'lambdalisue/vim-manpager'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jacoborus/tender.vim'
Plug 'bpstahlman/txtfmt'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'mhartington/oceanic-next'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'dracula/vim',{'as':'dracula'}
call plug#end()

" }}}

" augroups {{{

augroup indents
	autocmd!
	autocmd FileType less,css,html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType text,markdown setlocal expandtab
	autocmd FileType python setlocal ts=4 sts=4 sw=4 noexpandtab
augroup END

augroup Limelight
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!
augroup END

augroup highlight_follows_focus
	autocmd!
	autocmd WinEnter * set nocursorline
	autocmd WinLeave * set nocursorline
augroup END


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

set list
filetype indent on
set number
set relativenumber
set laststatus=2
set nowrap
set noshowmode
set nocursorline
set listchars=tab:│\ ,nbsp:␣,trail:∙,extends:>,precedes:<
set fillchars=vert:\│
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

"if (has("termguicolors"))
" set termguicolors
"endif

syntax enable
colorscheme nord

highlight shQuote cterm=italic ctermfg=006
highlight shCmdSubRegion cterm=italic ctermfg=006
highlight bashStatement cterm=italic ctermfg=003
highlight shCommandSub cterm=italic ctermfg=002
highlight shOperator cterm=italic ctermfg=006
highlight shOption cterm=none ctermfg=255
highlight shVariable cterm=none ctermfg=255
highlight shDerefSimple cterm=none ctermfg=006
highlight shNumber cterm=none ctermfg=255
highlight shSingleQuote cterm=italic ctermfg=002
highlight shSpecial cterm=none ctermfg=006
highlight shFunction cterm=italic ctermfg=004
highlight shFunctionOne cterm=none ctermfg=255
highlight shLoop cterm=none ctermfg=005
highlight shFor cterm=none ctermfg=255
highlight shRange cterm=none ctermfg=006
highlight shTestOpr cterm=none ctermfg=255
highlight shExpr cterm=none ctermfg=007
highlight shConditional cterm=none ctermfg=005
highlight shStatement cterm=italic ctermfg=006
highlight shDoubleQuote cterm=italic ctermfg=002
highlight PreProc cterm=italic ctermfg=006
highlight shDerefVar cterm=italic ctermfg=255
highlight Delimiter cterm=none ctermfg=003
highlight shDerefSpecial cterm=none ctermfg=255
highlight shCurlyIn cterm=none ctermfg=255
highlight shCtrlSeq cterm=italic ctermfg=002
highlight Comment cterm=italic ctermfg=008
highlight StartifyHeader ctermfg=006
highlight StartifyNumber ctermfg=004
highlight StartifySection ctermfg=006
highlight StartifyBracket ctermfg=001
highlight StartifySlash ctermfg=004
highlight StartifyFile ctermfg=255
highlight StartifyPath ctermfg=001

let g:limelight_conceal_ctermfg = 1
let g:startify_padding_left = 10
let g:startify_bookmarks = [ '~/dots/neovim/.config/nvim/init.vim','~/.config/', '~/dots/zsh/.zshrc', '~/dots/xconfs/.Xresources', '~/dots/termite/.config/termite/config', '~/dots/bspwm/.config/bspwm/bspwmrc', '~/dots/sxhkd/.config/sxhkd/sxhkdrc'  ]
let g:startify_lists = [
    \ { 'type': 'files',        'header': [ '  Recent']        },
    \ { 'type': 'bookmarks',    'header': [ '  Bookmarks']     },
    \]

set shiftwidth=4     " indent = 4 spaces
set expandtab      " tabs are tabs
set tabstop=8        " tab = 4 spaces
set softtabstop=0    " backspace through spaces
set smarttab
" }}}

" statusline {{{

let g:currentmode={
    \ 'n'  : 'normal ',
    \ 'no' : 'n·operator pending ',
    \ 'v'  : 'visual ',
    \ 'V'  : 'v·line ',
    \ '' : 'v·block ',
    \ 's'  : 'select ',
    \ 'S'  : 's·line ',
    \ '' : 's·block ',
    \ 'i'  : 'insert ',
    \ 'R'  : 'replace ',
    \ 'Rv' : 'v·replace ',
    \ 'c'  : 'command ',
    \ 'cv' : 'vim ex ',
    \ 'ce' : 'ex ',
    \ 'r'  : 'prompt ',
    \ 'rm' : 'more ',
    \ 'r?' : 'confirm ',
    \ '!'  : 'shell ',
    \ 't'  : 'terminal '}


set statusline=
set statusline+=%#PrimaryBlock#
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%#SecondaryBlock#
"set statusline+=%{StatuslineGit()}
set statusline+=%#TeritaryBlock#
set statusline+=\ %f\ 
set statusline+=%M\ 
set statusline+=%#TeritaryBlock#
set statusline+=%=
set statusline+=%#SecondaryBlock#
set statusline+=\ %Y\ 
set statusline+=%#PrimaryBlock#
set statusline+=\ %P\ 

function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
" }}}

" functions {{{

function! GetTabber()  " a lil function that integrates well with Tabular.vim
	let c = nr2char(getchar())
	:execute 'Tabularize /' . c
endfunction

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

" mappings {{{

let mapleader=' '

" nnoremap {{{
nnoremap <Leader>o : only<cr>
nnoremap <Leader>l : Lines<cr>
nnoremap <Leader>f : NERDTreeFind ~/.<cr>
nnoremap <Leader>z : tabnew<cr>
nnoremap <Leader>w : MtaJumpToOtherTag<cr>
nnoremap <Leader>t : call GetTabber()<cr>
nnoremap <Leader>n : tabnext<cr>
nnoremap <Leader>N : tabprevious<cr>
nnoremap <F2>      : NERDTreeToggle<cr>
nnoremap <Leader>N : tabprevious<cr>
nnoremap <Leader><ESC> : nohlsearch<cr>
nnoremap <C-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
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
cab dst put =strftime('%d %a, %b %Y')<cr>
cab vg vimgrep
" }}}

" plugin settings {{{

" git gutter settings {{{
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '+'
let g:gitgutter_sign_modified                  = '±'
let g:gitgutter_sign_removed                   = '-'
let g:gitgutter_sign_removed_first_line        = '^'
let g:gitgutter_sign_modified_removed          = '#'
" }}}

" emmet {{{
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-X>'
" }}}

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
            \ '         @@@  @@@  @@@  @@@  @@@  @@@@@@@@@@ ',
            \ '         @@@@ @@@  @@@  @@@  @@@  @@@@@@@@@@@',
            \ '         @@!@!@@@  @@!  @@@  @@!  @@! @@! @@!',
            \ '         !@!!@!@!  !@!  @!@  !@!  !@! !@! !@!',
            \ '         @!@ !!@!  @!@  !@!  !!@  @!! !!@ @!@',
            \ '         !@!  !!!  !@!  !!!  !!!  !@!   ! !@!',
            \ '         !!:  !!!  :!:  !!:  !!:  !!:     !!:',
	    \ '         :!:  !:!   ::!!:!   :!:  :!:     :!:',
	    \ '          ::   ::    ::::     ::  :::     :: ',
	    \ '          ::    :      :      :     :      : ',
	    \ ]

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
let g:WebDevIconsOS = 'Linux'
" }}}
