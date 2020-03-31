set nocompatible

" Sets <leader> to Space
let mapleader =" "
let localleader =" "

syntax on

" Default colorscheme looks ugly in my terminal
colorscheme ron

" Enables filetype plugin
filetype indent plugin on

" Shows line number
set nu

" Set relative number
set rnu

" Set ignorecase search
set ignorecase

" When searching try to be smart about cases
set smartcase

" Set highlight search result
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Highlight the current cursorline
set cursorline

" Noah's suggestion because swap files are just a pain in the ...
set noswapfile
set nobackup

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Define tabs as spaces {{{

  " Source: https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces

  set tabstop=2       " The width of a TAB is set to 2. Still it is a \t.
                      " It is just that Vim will interpret it to be having a width of 2.
  set shiftwidth=2    " Indents will have a width of 2
  set softtabstop=2   " Sets the number of columns for a TAB
  set expandtab       " Expand TABs to spaces
" }}}

" Keybindings {{{

  " Map CTRL+s to :w
  nmap <C-s> :w<CR>

  " Map CTRL+q to :q
  nmap <C-q> :q<CR>

  " Remap for shifting text
  vnoremap < <gv
  vnoremap > >gv

  " Map copy/paste
  map <leader>c "+y
  map <leader>v "+p

  " Toggle line number and relative line number
  nmap <leader><leader>n :set nu! rnu!<CR>
" }}}
