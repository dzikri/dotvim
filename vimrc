" vimrc by Stephen Zhang <StephenPCG@gmail.com>
set nocompatible 
set t_Co=256

if $SUDO_USER != '' && $USER !=# $SUDO_USER && $HOME !=# expand('~'.$USER)
    let $HOME = expand('~'.$USER)
endif

runtime bundles-enabled/pathogen/autoload/pathogen.vim
call pathogen#infect('bundles-enabled')

silent! source $HOME/.vim/vimrcs/functions.vimrc
silent! source $HOME/.vim/vimrcs/general.vimrc
silent! source $HOME/.vim/vimrcs/plugins.vimrc
silent! source $HOME/.vim/vimrcs/filetype.vimrc
silent! source $HOME/.vim/vimrcs/personal.vimrc
silent! source $HOME/.vim/vimrcs/keys.vimrc
