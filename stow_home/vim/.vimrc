set nocompatible

syntax on

" Default colorscheme looks ugly in my terminal
colorscheme ron

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

" Map CTRL+s to :w
nmap <C-s> :w<CR>

" Map CTRL+q to :q
nmap <C-q> :q<CR>

" Noah's suggestion because swap files are just a pain in the ...
set noswapfile
set nobackup

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
