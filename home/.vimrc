set nocompatible
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leaders.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle nstall
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vundle_autoinstall = 0
let vundle_readme = expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let vundle_autoinstall = 1
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Bundles. Here be snakes.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Let vundle manage vundle
Bundle 'gmarik/vundle'

""" Awesome color support
Bundle 'gorodinskiy/vim-coloresque'

""" Sass, haml and Scss
Bundle 'tpope/vim-haml'

""" Undotree
Bundle 'sjl/gundo.vim'

""" Golang
Bundle 'jnwhiteh/vim-golang'

""" Rails
""" Defacto for rails devolpment
"Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'

""" Sublime like multi-line-select
Bundle 'terryma/vim-multiple-cursors'

""" Silver surfer
Bundle 'rking/ag.vim'

""" Airline
Bundle 'bling/vim-airline'

""" CtrlP
Bundle 'kien/ctrlp.vim'
Bundle 'kirstein/ctrlp-funky'

""" Emmet
Bundle 'mattn/emmet-vim'

""" Gist
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

""" Nerdcommenter
Bundle 'scrooloose/nerdcommenter'

""" Repeat - repet enchance for tpope plugin
Bundle 'tpope/vim-repeat'

""" Slime - repl everything with tmux
Bundle 'jpalardy/vim-slime'

""" Supertab
Bundle 'ervandew/supertab'

""" Syntastic
Bundle 'scrooloose/syntastic'

""" Tabular - align text with ease
Bundle 'godlygeek/tabular'

""" Textobj
Bundle 'kana/vim-textobj-user'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'kana/vim-textobj-indent'

""" Vertical move - try to jump as far as possible without newline
Bundle 'bruno-/vim-vertical-move'

""" Autoclose endings
Bundle 'kana/vim-smartinput'

""" Coffee-script
Bundle 'kchmck/vim-coffee-script'

""" Easymotion
Bundle 'Lokaltog/vim-easymotion'

""" Fugitive - git support
Bundle 'tpope/vim-fugitive'

""" Gitgutter - show modification gutter
Bundle 'airblade/vim-gitgutter'

""" JS support
Bundle 'pangloss/vim-javascript'
Bundle 'moll/vim-node'

""" Matchit - make % more useful
Bundle 'tsaleh/vim-matchit'

""" Show marks as gutter
Bundle 'kshenoy/vim-signature'

""" Snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim.git'
Bundle 'garbas/vim-snipmate'
Bundle 'kirstein/vim-snippets'

""" Surround
Bundle 'tpope/vim-surround'

""" Unimpaired - paired mappings
Bundle 'tpope/vim-unimpaired'

""" Visual start - better search with * in visual mode
Bundle 'bronson/vim-visual-star-search'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Automatically install bundles
" => if the system did not have vundle installed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if vundle_autoinstall
  echo "Installing bundles..."
  echo ""
  :BundleInstall
endif

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers=['jshint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap /a <esc>:'<,'>:Tabular /

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Slime
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: CoffeeScript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap /c <esc>:'<,'>:CoffeeCompile<CR>
map /c :CoffeeCompile<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Gundotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("persistent_undo")
    set undodir = "~/.undodir/"
    set undofile
endif

let g:gundo_width = 60
let g:gundo_preview_height = 20
let g:gundo_auto_preview = 0
nmap <F3> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gb :Gblame<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_leader_key = '<Space>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bind K to grep word under cursor
nmap K :Ag! "<C-R><C-W>"<CR>
vmap K y:<C-U>Ag! '<C-R>"'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_theme="murmur"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap /d :CtrlPCurWD<CR>
nnoremap /b :CtrlPBuffer<CR>
nnoremap /m :CtrlPMRU<CR>
nnoremap /f :CtrlPFunky<CR>
" narrow the list down with a word under cursor
nnoremap /fu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Add fugitive porn to ignore
let g:ctrlp_custom_ignore = '\.fugitive.*'

" Overwrite the default mapping in order to let the C+p work
let g:ctrlp_map = "/t"
let g:ctrlp_extensions = [ 'funky' ]
let g:ctrlp_working_path_mode = 'ra'
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = 'jmeter\|coverage\|target\|node_modules\|.DS_Store\|.git\'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Directory assigning
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make PWD the current file
nnoremap \cd :cd %:p:h<CR>:pwd<CR>

" Set variable on vim initiation
let g:root_dir = getcwd()
" Navigate to root `root_dir` directory
nnoremap \rd :execute ':cd ' . root_dir<CR>:pwd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Last tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Reload vimrc config each time
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clipboard fun
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
" Since we use supertab, we really do not sue ctrl p anymore
inoremap <C-p> "+gP

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=manual
set foldnestmax=10
set nofoldenable " dont fold by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>q :q<CR>

" Keep the visual block if indenting
vnoremap > >gv
vnoremap < <gv

" Incremental search. This is kind of amazing
set incsearch

" Make sure that if i hyper-click my leader i wont get jumped back
nmap ,, <NOP>

" Allow unsaved buffers
set hidden

" map @q to Q
nnoremap Q @q

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Toggle f2 as paste mode
set pastetoggle=<F2>

" Sets how many lines of history VIM has to remember
set history=70000

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>s :w!<cr>

" Replace word under the cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*/tmp/*,*/*-target/,*/node_modules/,*.zip,*.o,*~,*.pyc

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

" Toggle search highlighting
nmap <Leader>n :set hls!<cr>
vmap <Leader>n :set hls!<cr>

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
set term=screen-256color
set t_Co=256

se cursorline

set background=dark
colorscheme molokai

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use paces instead of tabs
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

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Use one space instead of two when joining lines
set nojoinspaces

" Replace highlight line when insert and vice versa
autocmd InsertEnter,InsertLeave * set cul!

" Use relative numbers
set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List char
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:.
map <Leader>l :set list!<CR>

" Colors for chars
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remove trailing whitespaces when dealing with certain languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType javascript,python,coffee,vim,html autocmd BufWritePre <buffer> :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 3
let g:netrw_sort_options = 'i'
let g:netrw_altv         = 1
let g:netrw_browse_split = 4

" Toggle Vexplore with Ctrl-E
fun! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
      :vertical resize 30
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Wrap everything to console.time - console.timeEnd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! ConsoleTime() range
  let name = input("Name: ")
  "let name = 'test'
  if len(name) > 0
    let start = "console.time('".name."')"
    let end   = "console.timeEnd('".name."')"
    normal `>j
    exe "normal! O".end."\<CR>"
    normal `<k
    exe "normal! o\<CR>".start
    normal `<
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Thats it, thats all folks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
