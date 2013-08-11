" Set extra options when running in GUI mode
set guioptions-=T
set guioptions+=e
set t_Co=256
set guitablabel=%M\ %t
set guifont=Inconsolata:h22

" fullscreen mode magic
set fuopt+=maxhorz                      " grow to maximum horizontal width on entering fullscreen mode
map <D-CR> :set fu!<CR>                 " toggle fullscreen mode
