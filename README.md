![term](https://user-images.githubusercontent.com/63921693/148647996-9861f3a2-50b8-4ce3-b9be-59f7f3e20c7f.png)

# .dotfiles

## Installation

Install oh-my-zsh
```
sudo apt-get install zsh curl git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
0")"
```

Clone the git repo
```
git clone https://github.com/YigitGunduc/.dotfiles.git ~/.dotfiles

cd ~/.dotfiles
```

run the install script
```
bash install.sh
```

## Shell 

zsh

zsh theme ```robbyrussell```

### plugins

- z
- git 
- colorize
- web-search
- colored-man-pages
- zsh-syntax-highlighting
- zsh-autosuggestions

### Tools and utilities

`compilers & build tools`

- g++
- gcc
- tcc
- clang
- cmake
- clangd
- nodejs
- libtool
- autoconf
- automake
- python3-pip
- build-essential

`file explorers`
- ripgrep
- tree
- ranger
- fzf

`monitoring`
- htop
- ncdu
- neofetch
- screenfetch

`term`
- zsh
- vim
- tmux
- neovim
- alacritty

`useful utils`
- git
- curl
- wget
- peek
- grip

### custom functions

- __lines__ <br>
accepts the file name or extention as arg <br>
and returns the number of line the file contanins <br>
example command to see how long are the c files: ```lines "*.c"```

- __explorer__ <br>
opens the file explorer in the cwd <br>
```explorer```

- __crypto__ <br>
displays the crypto prices <br>
accepts the optional argument crypto symbol <br>
```crypto``` or ```crypto eth``` 

- __weather__ <br>
displays the weather in your location if no argumest supplyed <br>
accepts optional argument location <br>
```weather``` or ```weather rome```

## Term
alacritty

## Terminal Multiplayer
Tmux

prefix ```C-a```

### keymaps

| keymap| function       |
|-------|----------------|
|S-Left | previous-window|
|S-Right| next-window|
|S-up   | new-window|
|S-down | kill-window|
|S-left | prev|
|S-right| next|
| prefix + Tab | last-window |
| prefix + h | select-pane -L|
| prefix + j | select-pane -D|
| prefix + k | select-pane -U|
| prefix + l | select-pane -R|
| prefix + 'H' | resize-pane -L 2|
| prefix + 'J' | resize-pane -D 2|
| prefix + 'K' | resize-pane -U 2|
| prefix + 'L' | resize-pane -R 2|

## NVIM

### Plugins

- ryanoasis/vim-devicons
- mhinz/vim-startify
- airblade/vim-gitgutter
- dense-analysis/ale
- ellisonleao/glow.nvim
- jiangmiao/auto-pairs
- alvan/vim-closetag
- frazrepo/vim-rainbow
- luochen1990/rainbow
- voldikss/vim-floaterm
- neovim/nvim-lspconfig
- neoclide/coc.nvim
- honza/vim-snippets
- nvim-telescope/telescope.nvim
- vim-airline/vim-airline
- vim-airline/vim-airline-themes
- ajmwagar/vim-deus
- morhetz/gruvbox
- preservim/nerdtree
- tiagofumo/vim-nerdtree-syntax-highlight
- preservim/nerdcommenter
- Yggdroot/indentLine
- sheerun/vim-polyglot
- othree/html5-syntax.vim

### Keymaps

| keymap | function |
|--------|-----------|
| ``` <leader>mp ``` | preview markdown |
| ``` <C-t> ``` | NERD Tree Toggle|
| ``` <leader>t ``` | toggle floaterm|
| ``` <leader>e ``` | Coc explorer|
| ``` <leader>f ``` | Coc quick fix|
| ``` gd ``` | coc-definition|
| ``` gD ``` | coc-implementation|
| ``` gr ``` | coc-references|
| ``` <leader>ff ``` | Telescope find_files|
| ``` <leader>fg ``` | Telescope live_grep|
| ``` <leader>fb ``` | Telescope buffers|
| ``` <leader>fh ``` | Telescope help_tags |
| ``` <leader>c<leader> ``` | comment selected section |
| ``` <C-h> ``` | <C-w>h|
| ``` <C-j> ``` | <C-w>j|
| ``` <C-k> ``` | <C-w>k|
| ``` <C-l> ``` | <C-w>l|
| ``` <leader>p ``` | jump to previous buffer |
| ``` <leader>n ``` | jump to next buffer |
| ``` <Tab> ``` | >>|
| ``` <S-tab> ``` | <<|
| ``` <S-Tab> ``` | <Esc><<i|
| ``` <Tab> ``` | >gv|
| ``` <S-Tab> ``` | <gv|
| ``` <S-Left> ``` | <Esc>bi|
| ``` <S-Left> ``` | b|
| ``` <S-Right> ``` | <Esc><Right>wi|
| ``` <S-Right> ``` | w|
| ``` <S-Up> ``` | k|
| ``` <S-Down> ``` | j|
| ``` <leader><Up> ``` | :wincmd k<CR>|
| ``` <leader><Down> ``` | :wincmd j<CR>|
| ``` <leader><Left> ``` | :wincmd h<CR>|
| ``` <leader><Right> ``` | :wincmd l<CR>|
| ``` <C-S-Right> ``` | :vertical resize -1|
| ``` <C-S-Left> ``` | :vertical resize +1|
| ``` <leader>h ``` | split horizantal |
| ``` <leader>v ``` | :split vertical |
| ``` <leader>b ``` | create a new buffer |
