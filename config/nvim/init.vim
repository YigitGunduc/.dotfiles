" ██╗███╗░░██╗████████╗██╗░░░██╗░░░██╗██╗███╗░░░███╗
" ██║████╗░██║╚══██╔══╝██║░░░██║░░░██║██║████╗░████║
" ██║██╔██╗██║░░░██║░░░██║░░░╚██╗░██╔╝██║██╔████╔██║
" ██║██║╚████║░░░██║░░░██║░░░░╚████╔╝░██║██║╚██╔╝██║
" ██║██║░╚███║░░░██║░░░██║██╗░░╚██╔╝░░██║██║░╚═╝░██║
" ╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

" === Search === "
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex === Indentation === "
set autoindent              " indent a new line the same amount as the line just typed set smartindent
set encoding=UTF-8          " encoding
set foldmethod=indent       " dont wrap indent
filetype plugin indent on   " allow auto-indenting depending on file type
set backspace=start,eol,indent
map <leader><space> :let @/=''<cr> " clear search " use leader space to clear search
nnoremap / /\v
vnoremap / /\v

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

" === general settings ===
set title                   " show title in console title bar
set cursorline              " highlights the line that cursor is on
set wildmenu                " Menu completion in command mode on <Tab>
set wildmode=full           " <Tab> cycles between all matching choices.
set noshowcmd               " disable showing previous commands
let mapleader=" "           " leader is space
set signcolumn=yes          " enable sign column always 
set noswapfile              " disable creating swap file
set nohlsearch              " no highlight after done searching
set so=10                   " scroll offset
set mouse=a                 " enable mouse
set nowrap                  " no wrap for sentences that are too long
set number                  " add line numbers
set laststatus=2
set nofoldenable            " disable folding
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
" set spell                   " enable spell check (may need to download language package)

" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

call plug#begin("~/.vim/plugged")
 " general utilities
  Plug 'ryanoasis/vim-devicons'                       " icon support for file manager
  Plug 'mhinz/vim-startify'                           " file launcher / startup
  Plug 'airblade/vim-gitgutter'                       " vim git integration
  Plug 'dense-analysis/ale'                           " Check syntax
  Plug 'ellisonleao/glow.nvim'                        " markdown preview

  " brackets
  Plug 'jiangmiao/auto-pairs'                         " auto pairing brackets 
  Plug 'alvan/vim-closetag'                           " auto match and close html tags
  Plug 'luochen1990/rainbow'                          " improved rainbow brackets

  " terminal
  Plug 'voldikss/vim-floaterm'                        " terminal emulator

  " completion
  Plug 'neovim/nvim-lspconfig'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}     " autocompletion
  Plug 'honza/vim-snippets'                           " vim snippets for languages

  " fuzzy finder 
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdat'}

  " Airline
  Plug 'vim-airline/vim-airline'                      " Airline 
  Plug 'vim-airline/vim-airline-themes'               " Airline themes 

  " Color schemes
  Plug 'NLKNguyen/papercolor-theme'                   " color scheme
  Plug 'ajmwagar/vim-deus'                            " color scheme
  Plug 'morhetz/gruvbox'                              " color scheme

  " Nerd Tree Ecosystem
  Plug 'preservim/nerdtree'                           " file explorer
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " nerd tree syntax highlighting
  Plug 'preservim/nerdcommenter'                      " multi line commenter

  " syntax highlighting & indentation
  Plug 'Yggdroot/indentLine'                          " indentation
  Plug 'othree/html5-syntax.vim'                      " html 5 syntax
call plug#end()



" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" === IndentLine === "
let g:indentLine_char = '┊'  " char for indentLine
let g:indentLine_enabled = 1 " enables indentLine

" === rainbow brackets === "
let g:rainbow_active = 1     " activate rainbow brackets

" === Glow === "
noremap <leader>mp :Glow<CR>  "preview markdown

" === close tags === "
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_html_style=1

" === NerdTree === "
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " shows hidden files

" files to ignore
let g:NERDTreeIgnore = ['^node_modules$']

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" === Floaterm === "
let g:floaterm_keymap_toggle = '<leader>tf' " floaterm toggle

" === Coc === "

" coc explorer
nmap <leader>e <Cmd>CocCommand explorer<CR>

" apply quick fix
nmap <leader>f <Plug>(coc-fix-current)

" jump to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc externsions
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-clangd',
  \ 'coc-pyright',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-explorer',
  \ ]

" Use tab to scroll through autocomplete menus
autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
autocmd filetype javascript set sw=2 ts=2 expandtab
let g:acp_completeoptPreview=1

" === telescope.nvim === "
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" === Ale === "
" pylint and flake8 for python
let g:ale_completion_enabled = 1
let g:ale_linters = { 'python': ['', ''], 
                    \ 'javascript': ['eslint'],
                    \ 'c': ['clang'],
                    \ 'cpp': ['clang'] }

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline+=%=
set statusline+=\ %{LinterStatus()}

"jump to the next error 
nmap <silent> <C-e> <Plug>(ale_next_wrap) 

" display ale error in the Airline 
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 1
let g:ale_fix_on_save = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" === Airline === "
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" color schemes
set t_Co=256
set termguicolors           " enable gui colors for term
set background=dark         " Setting dark mode
color gruvbox 

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
nmap <S-Up> k
nmap <S-Down> j

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

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

" use % to jump between pairs
set matchpairs+=<:> 

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
