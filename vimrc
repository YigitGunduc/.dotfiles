" ============================================================================ "
" ===                           EDITOR OPTIONS                             === "
" ============================================================================ "

" === Search === "
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
nnoremap / /\v
vnoremap / /\v

" === Indentation === "
set autoindent              " indent a new line the same amount as the line just typed
set smartindent
set encoding=UTF-8          " encoding
set foldmethod=indent
filetype plugin indent on   " allow auto-indenting depending on file type
set backspace=start,eol,indent

" === Tab === "
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set smarttab

" === Splits === "
set splitright              " open new split panes to right 
set splitbelow              " open new split panes to below

" === Timeout === "
set ttimeoutlen=100 

" general settings
set title                   " show title in console title bar
set cursorline              " highlights the line that cursor is on
set wildmenu                " Menu completion in command mode on <Tab>
set wildmode=full           " <Tab> cycles between all matching choices.
set noshowcmd               " disable showing previous commands
let mapleader=" "           " leader is space
set noswapfile              " disable creating swap file
set nohlsearch              " no highlight after done searching
set so=10                   " scroll offset
set mouse=a                 " enable mouse
set nowrap                  " no wrap for sentences that are too long
set number                  " add line numbers
set laststatus=2            " shows the bottom line all times
set nofoldenable            " disable folding
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
" set spell                   " enable spell check (may need to download language package)

" color schemes
syntax on                   " syntax highlighting
set t_Co=256
set termguicolors           " enable gui colors for term
set background=dark         " Setting dark mode

colorscheme desert

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" copies filepath to clipboard by pressing yf
nnoremap <silent> yf :let @+=expand('%:p')<CR>

" copies pwd to clipboard: command yd
nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

" move among buffers with CTRL
map <leader>p :bprev<CR>
map <leader>n :bnext<CR>

" tab indentation
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" word movement
imap <S-Left> <Esc>bi
nmap <S-Left> b
imap <S-Right> <Esc><Right>wi
nmap <S-Right> w

" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

" resize splits
noremap <silent> <C-S-Right> :vertical resize -1<CR>
noremap <silent> <C-S-Left> :vertical resize +1<CR>

" shortcuts for splits 
noremap <leader>h :split<Space>
noremap <leader>v :vsplit<Space>

" shortcut for opining a file in a buffer 
noremap <leader>b :tabedit<Space>

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" auto closing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" clear search
map <leader><space> :let @/=''<cr> 

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" use % to jump between pairs
set matchpairs+=<:> 

" Formatting
map <leader>q gqip

" ============================================================================ "
" ===                       FileType specific changes                     ===  "
" ============================================================================ "

" Javascript
au BufRead *.js set makeprg=jslint\ %

" Use tab to scroll through autocomplete menus
autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
autocmd filetype javascript set sw=2 ts=2 expandtab

" Python
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au FileType python set foldmethod=indent foldlevel=99
