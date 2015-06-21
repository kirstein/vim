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

Bundle 'pydave/vim-hiinterestingword'
Bundle 'sjl/clam.vim'

Bundle 'jaxbot/github-issues.vim'

""" AMAZING hyperfocus thing
Bundle 'junegunn/limelight.vim'
Bundle 'junegunn/goyo.vim'

""" Jsdoc
Bundle 'heavenshell/vim-jsdoc'

Bundle 'tmux-plugins/vim-tmux-focus-events'

""" Tags
" Bundle 'xolox/vim-misc'
" Bundle 'lukaszkorecki/CoffeeTags'
" Removed due the problem with tag creating which makes it extremely slow
" Bundle 'xolox/vim-easytags'
" Bundle 'majutsushi/tagbar'

""" React
Bundle 'mxw/vim-jsx'

""" Haskell stuff
Bundle 'dag/vim2hs'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'Shougo/vimproc.vim'

""" Go to directory
Bundle 'justinmk/vim-gtfo'

""" Sass, haml and Scss
Bundle 'tpope/vim-haml'

""" Undotree
Bundle 'sjl/gundo.vim'

Bundle 'fatih/vim-go'
Bundle 'tpope/vim-markdown'
Bundle 'itspriddle/vim-marked'

""" Make sure to run
""" cd ~/.vim/bundle/YouCompleteMe
""" ./install.sh --clang-completer
Bundle 'Valloric/YouCompleteMe'
Bundle 'editorconfig/editorconfig-vim'

""" Silver surfer
Bundle 'rking/ag.vim'

""" Airline
Bundle 'bling/vim-airline'

""" CtrlP
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'kirstein/ctrlp-register'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'endel/ctrlp-filetype.vim'

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

Bundle 'tpope/vim-eunuch'

""" Surround
Bundle 'tpope/vim-surround'

""" Unimpaired - paired mappings
Bundle 'tpope/vim-unimpaired'

""" Project configuration
Bundle 'tpope/vim-projectionist'

""" Ruby
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-dispatch'

""" Visual start - better search with * in visual mode
Bundle 'thinca/vim-visualstar'
Bundle 'mustache/vim-mustache-handlebars'

Bundle 'vim-scripts/Tabmerge'

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
" => Bundle: Rails + rspec
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> \a :Dispatch rake test<CR>
map <silent> \t :Dispatch rake test TEST=%<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Jsdoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap /l :JsDoc<CR>
let g:jsdoc_return=0
let g:jsdoc_default_mapping=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Ultrasnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" c-o triggers a snippet
let g:UltiSnipsExpandTrigger="<c-o>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers=['jsxhint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clam
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ! :Clam<space>
vnoremap ! :ClamVisual<space>

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

set suffixesadd+=.coffee

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
nnoremap /a :CtrlPCurFile<CR>
nnoremap /s :CtrlPFiletype<CR>

" narrow the list down with a word under cursor
nnoremap /fu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Add fugitive porn to ignore
let g:ctrlp_custom_ignore = '\.fugitive.*'

" Overwrite the default mapping in order to let the C+p work
let g:ctrlp_map = "/t"
let g:ctrlp_extensions = [ 'funky', 'register', 'filetype' ]

let g:ctrlp_working_path_mode = 'ra'
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = 'jmeter\|coverage\|target\|node_modules\|.DS_Store\|.git\'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => React
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>e <Plug>(go-rename)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

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
" let g:CoffeeAutoTagFile='~/.tags'  " Name of the generated tag file (Default: ./tags)
" let g:CoffeeAutoTagTagRelative=1  " Sets file names to the relative path from the tag file location to the tag file location (Default: 1 [true])"

" nmap <F4> :Tagbar<CR>

" if executable('coffeetags')
"     let g:tagbar_type_coffee = {
"         \ 'ctagsbin' : 'coffeetags',
"         \ 'ctagsargs' : '',
"         \ 'kinds' : [
"             \ 'f:functions',
"             \ 'o:object',
"         \ ],
"         \ 'sro' : ".",
"         \ 'kind2scope' : {
"             \ 'f' : 'object',
"             \ 'o' : 'object',
"         \ }
"     \ }
" endif

" let g:easytags_auto_highlight = 1
" let g:easytags_file          = '~/.tags'
" let g:easytags_dynamic_files = 1
" let g:easytags_events        = ['BufReadPost', 'BufWritePost']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:marked_app = 'Marked'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=manual
set foldnestmax=10
set nofoldenable " dont fold by default

nnoremap <Leader>z zMzvzz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Third party shit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap vim :tabnew ~/.vimrc<CR>
nmap tig :!tig %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Give access to mouse support
" Usable for resizing panes
set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

" . is not a word!
set iskeyword-=.

" I constantly have a problem with leader s fast saving
" since i dont use s for replace lets remove it
map s <Nop>

" Don't move on *
" I'd use a function for this but Vim clobbers the last search when you're in
" a function so fuck it, practicality beats purity.
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

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

" Rotate through buffers
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>

nmap <silent> <leader>c :bp\|bd #<CR>, but I'm getting E94: No matching buffer for #<CR>'

" Select what has been pasted
noremap gV `[v`]

" Keep the visual block if indenting
vnoremap > >gv
vnoremap < <gv

" Allow unsaved buffers
set hidden

" map @q to Q, quicker macros
nnoremap Q @q

" Toggle f2 as paste mode
set pastetoggle=<F2>

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>s :w!<cr>

" Display the last search in quickfix window
nnoremap <silent> <Leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => window / pane magic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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
" => Yeah, no!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

ab lod: ಠ_ಠ
ab flip: (ﾉಥ益ಥ）ﾉ︵┻━┻
ab yuno: ლ(ಠ益ಠლ))

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

" Automatic save on buffer change etc
set autowriteall

" Replace highlight line when insert and vice versa
autocmd InsertEnter,InsertLeave * set cul!

" Use relative numbers
set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List char
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showbreak=↪

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
" => Source private config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

so ~/.vimrc-private
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Thats it, thats all folks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
