" vimrc of Stephen Zhang <stephenpcg@gmail.com>
set nocompatible
set t_Co=256
let mapleader = ";"

" get the absolute path of the file, so this vim conf can be saved
" anywhere and used by "vim -u /path/to/dotvim"
let g:vimrcroot = fnamemodify(resolve(expand('<sfile>:p')), ':h') . "/"
exec "source " . g:vimrcroot . "functions.vimrc"
let &runtimepath = &runtimepath . "," . g:vimrcroot

" {{{1 Pathogen Settings
if !has("lua")
  call WarnOnce("Missing 'lua' support, 'neocomplete' is disabled.")
  call DisablePlugin('neocomplete')
endif

if IsPathogenInstalled()
  call pathogen#infect(g:vimrcroot . 'bundles/{}')
else
  call WarnOnce("'Pathogen' installation not found, forget to update submodules?")
endif

" {{{1 General Settings
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
if has('autocmd')
  filetype plugin indent on
endif

set autoindent
set backspace=indent,eol,start
set smarttab
set shiftround
set ttimeout
set ttimeoutlen=50
set incsearch
set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
set laststatus=2
set ruler
set showcmd
set wildmenu
if !&scrolloff | set scrolloff=1 | endif
if !&sidescrolloff | set sidescrolloff=5 | endif
set display+=lastline
set autoread

" encoding stuffs
if (IsWindows())
  let &termencoding=&encoding
  set fileencodings=utf8,cp936,ucs-bom,latin1
else
  set encoding=utf8
  set fileencodings=utf8,gb2312,gb18030,utf-16le,utf-16be,ucs-bom,latin1
endif

set list
"if &listchars ==# 'eol:$'
"  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
"endif
set listchars=tab:▸\ ,eol:¬
" to insert ¬, type: ctrl-v u00ac
" to insert ▸, type: ctrl-v u25b8

if &history < 1000 | set history=1000 | endif
if &tabpagemax < 50 | set tabpagemax=50 | endif
if !empty(&viminfo) | set viminfo^=! | endif
set sessionoptions-=options

" Recover form accidental Ctrl-U
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

autocmd BufEnter * :syntax sync fromstart
set number
set lazyredraw
set hidden
set whichwrap+=<,>,h,l
set smartcase
set magic
set showmatch
set nobackup
set nowb
set lbr
set smartindent
set cindent
set formatoptions+=mMj1
set vb t_vb=
set background=dark
if IsPluginEnabled("solarized") | colorscheme solarized | else | colorscheme desert | endif
set noshowmode

hi SpecialKey ctermfg=238
hi NonText ctermfg=238
hi cursorline cterm=NONE ctermfg=1 ctermbg=252

"set completeopt-=preview
set completeopt+=longest

" {{{1 Plugin Settings
let s:PlugWinSize = 30

" {{{2 Libraries
" {{{3 L9 Vim script library
" http://www.vim.org/scripts/script.php?script_id=3252
" https://bitbucket.org/ns9tks/vim-l9/

" {{{3 tlib
" required by tSkeleton
" https://github.com/tomtom/tlib_vim

" {{{2 IDE Features
" {{{3 airline
" https://github.com/bling/vim-airline
if IsPluginEnabled("airline")
  " automatically displays all buffers when there's only one tab open
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
endif

" {{{3 Tagbar
" http://www.vim.org/scripts/script.php?script_id=3465
" https://github.com/majutsushi/tagbar
if IsPluginEnabled("tagbar")
  nmap <silent> T :TagbarToggle<cr>
  let g:tagbar_width = s:PlugWinSize
endif

" {{{3 nerdcommenter
" http://www.vim.org/scripts/script.php?script_id=1218
" https://github.com/scrooloose/nerdcommenter
" no extra options here, default key binds is modified in bundles
if IsPluginEnabled("nerdcommenter")
  nmap <leader>cc <plug>NERDCommenterToggle
  xmap <leader>cc <plug>NERDCommenterToggle
  let g:NERDCreateDefaultMappings = 0
endif
