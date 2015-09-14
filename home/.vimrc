filetype off
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leaders.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle install
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

""" Make sure to run
""" cd ~/.vim/bundle/YouCompleteMe
""" ./install.sh --clang-completer

Bundle 'gmarik/vundle'
Bundle 'AndrewRadev/switch.vim'
Bundle 'marijnh/tern_for_vim'
Bundle 'junegunn/goyo.vim'
Bundle 'duggiefresh/vim-easydir'
Bundle "kirstein/vim-execute-ft"
Bundle 'kirstein/CoffeeTags'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'majutsushi/tagbar'
Bundle 'dbakker/vim-projectroot'
Bundle 'mxw/vim-jsx'
""" Haskell stuff
" Bundle 'dag/vim2hs'
" Bundle 'eagletmt/ghcmod-vim'
" Bundle 'Shougo/vimproc.vim'
Bundle 'justinmk/vim-gtfo'
Bundle 'tpope/vim-haml'
Bundle 'fatih/vim-go'
Bundle 'tpope/vim-markdown'
Bundle 'itspriddle/vim-marked'
Bundle 'Valloric/YouCompleteMe'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'rking/ag.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'jpalardy/vim-slime'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'kana/vim-textobj-user'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'kana/vim-textobj-indent'
Bundle 'kana/vim-smartinput'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'pangloss/vim-javascript'
Bundle 'moll/vim-node'
Bundle 'edsono/vim-matchit'
Bundle 'kshenoy/vim-signature'
Bundle 'SirVer/ultisnips'
Bundle 'kirstein/vim-javascript-snippets'
Bundle 'kirstein/vim-javascript-node-snippets'
Bundle 'kirstein/vim-jsx-snippets'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-dispatch'
Bundle 'ecomba/vim-ruby-refactoring'
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
" => Bundle: Tern
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType javascript setlocal omnifunc=tern#Complete
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Testing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:execute_ft_commands = { 
  \'javascript': { 'all': 'Dispatch npm test', 'single': 'Dispatch npm test -- {file}' },
  \'ruby': { 'all': 'Rake spec test', 'single': 'Rake spec SPEC={file}' }
\}

map <silent> \\ :call ExecuteByFtLast()<CR>
map <silent> \a :call ExecuteByFT("all")<CR>
map <silent> \t :call ExecuteByFT("single")<CR>
map <silent> <C-c>j :wincmd j<CR>:bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Rails + rspec
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent><leader>. :A<CR>
map <silent><leader>\ :AV<CR>
map <silent><leader>rr :Rake routes<CR>

map <leader>em :Emodel 
map <leader>ec :Econtroller 
map <leader>ev :Eview 
map <leader>es :Estylesheet 
map <leader>vm :Vmodel 
map <leader>vc :Vcontroller 
map <leader>vv :Vview 
map <leader>vs :Vstylesheet 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Ultrasnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" c-o triggers a snippet
let g:UltiSnipsExpandTrigger="<c-o>"
let snipsDir = $HOME."/workspace/github/kirstein/vim-snippets/"
let g:UltiSnipsSnippetDirectories=[ 'UltiSnips' ]
if isdirectory(snipsDir)
  let g:UltiSnipsSnippetDirectories=[ snipsDir."**/UltiSnips" ]
else
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers=['jsxhint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Haskell shit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <leader>ht :GhcModTypeInsert<CR>
"au BufRead,BufNewFile,BufNew *.hss,*.hs setl ft=haskell.script

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap /a <esc>:'<,'>:Tabular /

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_min_num_of_chars_for_completion = 1

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
" => Bundle: Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gw :Gwrite<CR>

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
map <leader>f :Ag! 
map <leader>F :Ag! -i 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"statusline setup
set statusline =%#identifier#
set statusline+=\ \%t\ \   "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{fugitive#statusline()}
set laststatus=2

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle: Switch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> \s :Switch<cr>

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
nnoremap /x :CtrlPTag<CR>
nnoremap /a :CtrlPCurFile<CR>
nnoremap /g :CtrlPLine<CR>

" Add fugitive porn to ignore
let g:ctrlp_custom_ignore = '\.fugitive.*'

" Overwrite the default mapping in order to let the C+p work
let g:ctrlp_map = "/t"
let g:ctrlp_extensions = [ 'line' ]

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

" Navigate to root `root_dir` directory
nnoremap \rd :execute ':cd ' . projectroot#guess() <CR>:pwd<CR>

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
let g:CoffeeAutoTagFile=projectroot#guess() . "/.tags"
let g:CoffeeAutoTagUseDispatch=1

let g:easytags_async = 1
let g:easytags_dynamic_files = 1

set tags+=.tags

nmap <F4> :Tagbar<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Marked
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:marked_app = 'Marked'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofoldenable
set foldmethod=marker
set foldmarker={,}
set foldnestmax=2

autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent

nnoremap <Leader>z zMzAzz

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
set ttymouse=xterm2

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

map <Leader>ts :tab split<CR>
map <Leader>tc :tabc<CR>

nmap <Leader>q :q<CR>
map q: :q

map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Switch quickly between buffers
nmap // <c-^>

" Rotate through buffers
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>

nmap <silent> <leader>c :bp\|bd #<CR>

" Select what has been pasted
noremap gV `[v`]

" Keep the visual block if indenting
vnoremap > >gv
vnoremap < <gv

" Allow unsaved buffers
set hidden

" map @q to Q, quicker macros
" Used recursive mapping because of vim bekaboo
nmap Q @q

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
set wildmode=longest:full,full

" " Ignore compiled files
set wildignore=.git,*/tmp,*/node_modules

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

" Various characters are wider than normal fixed width characters, but the
" default setting of ambiwidth (single) squeezes them into normal width, which
" sucks.  Setting it to double makes it awesome.
set ambiwidth=double

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

" Shorthand for dispatch
nmap ! :Dispatch<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List char
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showbreak=↪

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:.

" Colors for chars
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remove trailing whitespaces when dealing with certain languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType ruby,python,javascript,coffee,markdown autocmd BufWritePre <buffer> :%s/\($\n\s*\)\+\%$//e

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
      exec 'wincmd w'
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
    normal! `>j
    exe "normal! O".end."\<CR>"
    normal! `<k
    exe "normal! o\<CR>".start
    normal! `<
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
" => Open the first matching variable with require statement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <silent> gw :call OpenFirstRequire()<CR>

function! OpenFirstRequire()
  let l:name = expand("<cword>")
  " Find require statement
  " Matches the following cases. Work both for js and coffeescript
  "  1. = require or =require
  "  2. ('location') or 'location' or ("location") or "location"
  let l:regexp = l:name . '\s*=\s*require\s*\((\|\s\)\(''\|"\).*\(''\|"\)\()\|\s*\)'
  let l:lnr = 0
  let l:loc = 0
  while l:lnr < line('$')
    let l:line = getline(l:lnr)
    if len(matchstr(l:line, l:regexp))
      for i in split(l:line, '\zs')
        if l:loc != 0 && len(matchstr(i, '\(''\|"\)'))
          call cursor(l:lnr, l:loc)
          normal! gF"
          return
        endif
        let l:loc = l:loc + 1
      endfor
      break
    endif
    let l:lnr = l:lnr + 1
  endwhile
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open the first matching variable with require statement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fill in require statement with the word under the cursor
function! AddRequire() 
  normal! "xyiw^[
  normal! Arequire('')
  normal! F';
  normal! "xpVi'u$
endfunction

autocmd FileType javascript,coffee nmap <C-i> :call AddRequire()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Highlight overlength columns
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType ruby,python,javascript,coffee,vim autocmd BufWritePre <buffer> match ErrorMsg '\%>100v.\+'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => I suck at spelling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iab reuqure require
iab reuire require
iab teh the

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Follow symlinks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  function! MyFollowSymlink(...)
    if exists('w:no_resolve_symlink') && w:no_resolve_symlink
      return
    endif
    let fname = a:0 ? a:1 : expand('%')
    if fname =~ '^\w\+:/'
      " Do not mess with 'fugitive://' etc.
      return
    endif
    let fname = simplify(fname)

    let resolvedfile = resolve(fname)
    if resolvedfile == fname
      return
    endif
    let resolvedfile = fnameescape(resolvedfile)
    let sshm = &shm
    set shortmess+=A  " silence ATTENTION message about swap file (would get displayed twice)
    exec 'file ' . resolvedfile
    let &shm=sshm

    " Re-init fugitive.
    call fugitive#detect(resolvedfile)
    if &modifiable
      " Only display a note when editing a file, especially not for `:help`.
      redraw  " Redraw now, to avoid hit-enter prompt.
      echomsg 'Resolved symlink: =>' resolvedfile
    endif
  endfunction
  command! FollowSymlink call MyFollowSymlink()
  command! ToggleFollowSymlink let w:no_resolve_symlink = !get(w:, 'no_resolve_symlink', 0) | echo "w:no_resolve_symlink =>" w:no_resolve_symlink
  au BufReadPost * nested call MyFollowSymlink(expand('%'))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Source private config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

so ~/.vimrc-private
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Thats it, thats all folks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
