" Set extra options when running in GUI mode
set guioptions-=r " remove right-hand scrollbar
set guioptions+=e " dont use gui tab
set guioptions-=T " hide toolbar
set guioptions-=L

set t_Co=256
set guitablabel=%M\ %t

" Disable the mouse, its amazingly annoying when dealing with gvim/macvim
set mouse=

if has("gui_macvim")
  set guifont=Inconsolata-dz\ for\ Powerline:h20
  " grow to maximum horizontal width on entering fullscreen mode
  set fuopt+=maxhorz
  " toggle fullscreen mode
  map <D-CR> :set fu!<CR>

else
  map <silent> <F11>
      \    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
  set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 16
endif

set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

