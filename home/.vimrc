execute pathogen#infect()
Helptags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Reload vimrc config each time
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
set noshowmode
let g:Powerline_symbols = 'fancy'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text bubbling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldnestmax=3
set nofoldenable " dont fold by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yank to clipboard
set clipboard+=unnamed

" Statline fugitive
"let g:statline_fugitive = 1

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" wraped lines
nnoremap j gj
nnoremap k gk

" Toggle f2 as paste mode
set pastetoggle=<F2>

" Save on focus lost
:au FocusLost * :wa

" Sets how many lines of history VIM has to remember
set history=70000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Can be typed even faster than jj.
:imap jj <Esc>

" Fast saving
nmap <leader>s :w!<cr>

" Replace word under the cursor
:nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Line numbers
set number

" support 256 colors in Lion terminal
set t_Co=256

se cursorline

set background=dark
colorscheme molokai

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Replace highlight line when insert and vice versa
:autocmd InsertEnter,InsertLeave * set cul!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FuzzyFinder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap /t :FufTaggedFile<CR>
nnoremap /b :FufBuffer<CR>
nnoremap /f :FufFileWithCurrentBufferDir<CR>

"FuzzyFinder should ignore all files in .gitignore
let ignorefile = ".gitignore"
if filereadable(ignorefile)

  let ignore = '\v\~$'
  for line in readfile(ignorefile)
    let line = substitute(line, '\.', '\\.', 'g')
    let line = substitute(line, '\*', '.*', 'g')
    let ignore .= '|^' . line
  endfor

  let g:fuf_coveragefile_exclude = ignore
endif

let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp|\.class$|coverage/|\.git|tags|node_modules|tmp/|.DS_Store'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Relative line numbers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List char
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:.

" Colors for chars
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

autocmd BufWritePre * :%s/\s\+$//e


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lets learn this shit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

""" Easymotion
let g:EasyMotion_leader_key = '<leader>'

""" Toggle tagbar
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indent guide colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let indent_guides_auto_colors = 0
:hi IndentGuidesOdd  guibg=darkgrey   ctermbg=236
:hi IndentGuidesEven guibg=darkgrey   ctermbg=237
let indent_guides_color_change_percent = 10
let indent_guides_guide_size = 1
let indent_guides_start_level = 2
set ts=2 sw=2 et

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_javascript_checkers=['jshint']
