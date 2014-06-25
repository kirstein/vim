cd home/.vim/bundle

function run {
  dir=$1
  cmd=$2
  pushd $dir && $cmd && popd
}

run ./vimproc.vim make
run ./YouCompleteMe ./install.sh


