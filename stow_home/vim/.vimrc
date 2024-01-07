" General settings {{{

  set nocompatible

  " Sets <leader> to Space
  let mapleader =" "
  let localleader =" "

  syntax on

  " Default colorscheme looks ugly in my terminal
  " colorscheme ron
  colorscheme dracula

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

  " Folding
  set nofoldenable
  set foldmethod=marker

  " Return to last edit position when opening files (You want this!)
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Remove trailing whitespace on save
  autocmd BufWritePre * %s/\s\+$//e

  " Autocompletion
  set wildmode=longest,list,full

  " Set horizontal column guide
  set colorcolumn=100

  " Easier splitmanagement
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  " Run: set list to enable these characters, set list! to disable
  set listchars=tab:>-,space:·,nbsp:␣,trail:•,eol:↲,precedes:«,extends:»,conceal:┊
"}}}

" Tabs and spaces settings {{{

  " Source: https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces

  set tabstop=2       " The width of a TAB is set to 2. Still it is a \t.
                      " It is just that Vim will interpret it to be having a width of 2.
  set shiftwidth=2    " Indents will have a width of 2
  set softtabstop=2   " Sets the number of columns for a TAB
  set expandtab       " Expand TABs to spaces
  set autoindent
  set smartindent
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

  " Replace function
  nnoremap <leader><leader>r :%s//gc<Left><Left><Left>

  "Switch buffers
  noremap <Tab> :bnext<CR>
  noremap <S-Tab> :bprevious<CR>

  " Closes buffer
  noremap <Leader><Tab> :bd<CR>
" }}}

" netrw {{{

  " " Tweaks for browsing
  let g:netrw_banner=0        " disable annoying banner
  let g:netrw_browse_split=4  " open in prior window
  let g:netrw_altv=1          " open splits to the right
  let g:netrw_liststyle=3     " tree view
  let g:netrw_list_hide=netrw_gitignore#Hide()
  let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
  let g:netrw_preview=1 " open previews vertically
  let g:netrw_winsize = 25

  " " NOW WE CAN:
  " " - :edit a folder to open a file browser
  " " - <CR>/v/t to open in an h-split/v-split/tab
  " " - check |netrw-browse-maps| for more mappings

  " Opens file explorer to the left
  map <silent> <leader><F2> :Lexplore<CR>
" }}}
