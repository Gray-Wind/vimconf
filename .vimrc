set t_Co=256

set nocompatible " disable vi compatibility
set autowrite " Writes on make/shell commands
set autoread
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set noexpandtab
set shell=zsh

set ttimeoutlen=50

set hidden " The current buffer can be put to the background without writing to disk

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase	" be sensitive when there's a capital letter

syntax on
set laststatus=2 " lets aircmd without splits

" formatting
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set textwidth=0		" Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives

set backspace=indent,eol,start	" more powerful backspacing

set tabstop=4
set shiftwidth=4
set smartindent

set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

" Visual
set showmatch " Show matching brackets
set matchtime=5 " Bracket blinking
set novisualbell " No blinking
set noerrorbells " No noise
set vb t_vb= " disable any beeps or flashes on error
set showcmd
set shortmess=atI

" set nolist  " Display unprintable characters f12 - switches
" set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

set splitbelow
set splitright

" show whitespaces
set list listchars=tab:→\ ,trail:·

" Show a vertical line on a 80th character
set textwidth=80
set colorcolumn=+1

" Scroll the window so we can always see 10 lines around the cursor
set scrolloff=10

set relativenumber

" save file with sudo priveleges
cmap w!! w !sudo tee > /dev/null %

function! Tabbufn()
	let s:tab_count = tabpagenr('$')
	if s:tab_count <= 1
		:bn
	else
		:tabnext
	endif
endfunction

function! Tabbufp()
	let s:tab_count = tabpagenr('$')
	if s:tab_count <= 1
		:bp
	else
		:tabprev
	endif
endfunction

" Tabs and buffers
nnoremap <silent> <LocalLeader>[ :call Tabbufp()<CR>
nnoremap <silent> <LocalLeader>] :call Tabbufn()<CR>

inoremap <S-Tab> <C-D>

filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" surrounding with brackets, quotes, etc
Plugin 'tpope/vim-surround'

" auto close quotes, brackets and other
Plugin 'Raimondi/delimitMate'

Plugin 'mkitt/tabline.vim'

Plugin 'bling/vim-airline'

Plugin 'scrooloose/nerdtree'
nnoremap <silent> <LocalLeader>t :NERDTree<CR>

Plugin 'scrooloose/syntastic'

" tComment
Plugin 'tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" After Esc hide all searched highlights
nnoremap <silent> <Leader><Leader> :nohl<return>

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'flazz/vim-colorschemes'

Plugin 'majutsushi/tagbar'
nmap <silent> <LocalLeader>p :TagbarToggle<CR>

Plugin 'bling/vim-bufferline'
let g:bufferline_echo = 0

Plugin 'ervandew/supertab'

Plugin 'andviro/flake8-vim'
let g:PyFlakeDisabledMessages = 'W191,E302,E251,E309,E128,E731,W391'
let g:PyFlakeOnWrite = 0

" Plugin 'kevinw/pyflakes-vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'bogado/file-line'

Plugin 'chrisbra/changesPlugin'

Plugin 'yegappan/mru'
nmap <silent> <LocalLeader>m :MRU<CR>

" Split line(opposite to S-J joining line)
nnoremap <silent> <C-J> gEa<CR><ESC>ew

call vundle#end()
filetype plugin indent on

autocmd FileType python setlocal foldmethod=indent cindent shiftwidth=4 ts=4 noet cinwords=if,elif,else,for,while,try,except,finally,def,class

colorscheme jellybeans
let g:airline_theme = "serene"
let g:airline#extensions#tabline#enabled = 1
set noshowmode

highlight ColorColumn ctermbg=233
highlight OverLength ctermbg=236
match OverLength /\%>80v.\+/
