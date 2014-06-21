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

""" Tags
Bundle 'xolox/vim-misc'
Bundle 'lukaszkorecki/CoffeeTags'
Bundle 'xolox/vim-easytags'
Bundle 'majutsushi/tagbar'

""" Awesome color support
Bundle 'gorodinskiy/vim-coloresque'

""" Haskell stuff
Bundle 'dag/vim2hs'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'Shougo/vimproc.vim'

""" Sass, haml and Scss
Bundle 'tpope/vim-haml'

""" Undotree
Bundle 'sjl/gundo.vim'

Bundle 'jnwhiteh/vim-golang'
Bundle 'tpope/vim-markdown'
Bundle 'itspriddle/vim-marked'

""" Make sure to run
""" cd ~/.vim/bundle/YouCompleteMe
""" ./install.sh --clang-completer
Bundle 'Valloric/YouCompleteMe'
Bundle 'editorconfig/editorconfig-vim'

""" Sublime like multi-line-select
Bundle 'terryma/vim-multiple-cursors'

""" Silver surfer
Bundle 'rking/ag.vim'

""" Airline
Bundle 'bling/vim-airline'

""" CtrlP
Bundle 'kien/ctrlp.vim'
Bundle 'kirstein/ctrlp-register'
Bundle 'tacahiroy/ctrlp-funky'

""" Emmet
Bundle 'mattn/emmet-vim'

""" Gist
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

""" Repeat - repet enchance for tpope plugin
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'

""" Slime - repl everything with tmux
Bundle 'jpalardy/vim-slime'
Bundle 'christoomey/vim-tmux-navigator'

""" Syntastic
Bundle 'scrooloose/syntastic'

""" Tabular - align text with ease
Bundle 'godlygeek/tabular'

""" Textobj
Bundle 'kana/vim-textobj-user'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'kana/vim-textobj-indent'

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
Bundle 'edsono/vim-matchit'

""" Show marks as gutter
Bundle 'kshenoy/vim-signature'

""" Ultrasnips
Bundle 'SirVer/ultisnips'
Bundle 'kirstein/vim-snippets'

""" Surround
Bundle 'tpope/vim-surround'

""" Unimpaired - paired mappings
Bundle 'tpope/vim-unimpaired'

""" Visual start - better search with * in visual mode
Bundle 'thinca/vim-visualstar'
Bundle 'mustache/vim-mustache-handlebars'

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
" => Bundle: Ultrasnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" c-o triggers a snippet
let g:UltiSnipsExpandTrigger="<c-o>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers=['jshint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Haskell shit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>ht :GhcModTypeInsert<CR>
"au BufRead,BufNewFile,BufNew *.hss,*.hs setl ft=haskell.script

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap /a <esc>:'<,'>:Tabular /

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_collect_identifiers_from_tags_files = 1

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
nmap <Leader>gs :Gstatus<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Space> <Plug>(easymotion-s)
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map /j <Plug>(easymotion-j)
map /k <Plug>(easymotion-k)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bind K to grep word under cursor
nmap K :Ag! "<C-R><C-W>"<CR>
vmap K y:<C-U>Ag! '<C-R>"'<CR>

" Find all todo tags
map todo :Ag! -i "todo"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_theme="murmur"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Gist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap /d :CtrlPCurWD<CR>
nnoremap /b :CtrlPBuffer<CR>
nnoremap /m :CtrlPMRU<CR>
nnoremap /f :CtrlPFunky<CR>
nnoremap /r :CtrlPRegister<CR>
nnoremap /x :CtrlPTag<CR>

" narrow the list down with a word under cursor
nnoremap /fu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Add fugitive porn to ignore
let g:ctrlp_custom_ignore = '\.fugitive.*'

" Overwrite the default mapping in order to let the C+p work
let g:ctrlp_map = "/t"
let g:ctrlp_extensions = [ 'funky', 'register' ]

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F4> :Tagbar<CR>

if executable('coffeetags')
    let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
            \ 'f:functions',
            \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
            \ 'f' : 'object',
            \ 'o' : 'object',
        \ }
    \ }
endif

let g:easytags_file          = '~/.tags'
let g:easytags_dynamic_files = 0
let g:easytags_events        = ['BufReadPost', 'BufWritePost']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=manual
set foldnestmax=10
set nofoldenable " dont fold by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Third party shit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap vim :tabnew ~/.vimrc<CR>
nmap tig :!tig %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" . is not a word!
set iskeyword-=.

" I constantly have a problem with leader s fast saving
" since i dont use s for replace lets remove it
map s <Nop>

set cm=blowfish

" God damn, i hate when new splits are added to left and top
set splitbelow
set splitright

" Consistant Y
map Y y$

map <silent> <Leader>e :call ToggleErrors()<CR>

map <Leader>ts :tab split<CR>
map <Leader>tc :tabc<CR>

nmap <Leader>q :q<CR>
map q: :q

" Switch quickly between buffers
nmap // <c-^>

" Select what has been pasted
noremap gV `[v`]

" Keep the visual block if indenting
vnoremap > >gv
vnoremap < <gv

" Allow unsaved buffers
set hidden

" map @q to Q, quicker macros
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
" => Jumping brackets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap % v%
set showmatch
set matchtime=3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use paces instead of tabs
set expandtab

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

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
" => Haskell mod section seperator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:width = 80

function! HaskellModuleSection(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Section name: ")

    return  repeat('-', s:width) . "\n"
    \       . "--  " . name . "\n"
    \       . "\n"

endfunction

nmap <silent> --s "=HaskellModuleSection()<CR>gp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Toggle errors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Thats it, thats all folks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
