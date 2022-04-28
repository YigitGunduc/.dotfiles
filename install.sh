#!/usr/bin/bash

# ██╗███╗░░██╗░██████╗████████╗░█████╗░██╗░░░░░██╗░░░░░░░░░██████╗██╗░░██╗
# ██║████╗░██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██║░░░░░░░░██╔════╝██║░░██║
# ██║██╔██╗██║╚█████╗░░░░██║░░░███████║██║░░░░░██║░░░░░░░░╚█████╗░███████║
# ██║██║╚████║░╚═══██╗░░░██║░░░██╔══██║██║░░░░░██║░░░░░░░░░╚═══██╗██╔══██║
# ██║██║░╚███║██████╔╝░░░██║░░░██║░░██║███████╗███████╗██╗██████╔╝██║░░██║
# ╚═╝╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝╚═╝╚═════╝░╚═╝░░╚═╝

# getting sudo privileges
sudo -v

# updating packages
echo "[INFO] updating packages"
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo add-apt-repository ppa:aslatter/ppa # alacritty source
sudo add-apt-repository ppa:neovim-ppa/unstable # nvim latest
sudo apt-get update

packages=(
  tcc
  g++
  gcc
  git
  zsh
  vim
  curl
  wget
  tmux
  htop
  tree
  peek
  ncdu
  grip
  clang
  cmake
  nodejs
  clangd
  ranger
  neovim
  ripgrep
  googler
  libtool
  glances
  autoconf
  automake
  neofetch
  alacritty
  python3-pip
  screenfetch
  build-essential
)

if [ "$(uname)" == "Darwin" ]; then
  brew="/usr/local/bin/brew"
  if [ -f "$brew" ]; then
    echo "Homebrew is installed, nothing to do here"
  else
    echo "Homebrew is not installed, installing now"
    echo "This may take a while"
    echo "Homebrew requires osx command lines tools, please download xcode first"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
fi

install_missing_packages() {
  for p in "${packages[@]}"; do
    if hash "$p" 2>/dev/null; then
      echo "$p is installed"
    else
      echo "$p is not installed"
      # Detect the platform (similar to $OSTYPE)
      OS="`uname`"
      case $OS in
        'Linux')
          sudo apt-get install -y $p || echo "$p failed to install" ;;
        'Darwin')
          brew install $p || echo "$p failed to install"
          ;;
        *) ;;
      esac
      echo "---------------------------------------------------------"
      echo "Done "
      echo "---------------------------------------------------------"
    fi
  done
}

echo "[INFO] installing packages"
install_missing_packages || echo "failed to install missing packages"

# creating .config files
mkdir -p ~/.config/nvim/
mkdir -p ~/.config/neofetch/
mkdir -p ~/.config/alacritty/
mkdir -p ~/.local/share/fonts/

# changing default shell to zsh
if [ "$SHELL" = "$(which zsh)" ]; then
  echo '[INFO] SHELL is already zsh'
else
  chsh -s "$(which zsh)" $whoami
fi

# installing vim plug for Neovim:
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# installing vim plug for Vim:
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# installing the droid sans font
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

echo "[INFO] removing existing config and .rc files"
rm ~/.zshrc 
rm ~/.vimrc
rm ~/.gitconfig 
rm ~/.tmux.conf 
rm ~/.bashrc 
rm ~/.config/nvim/init.vim 
rm ~/.config/neofetch/config.conf
rm ~/.config/alacritty/alacritty.yml

echo "[INFO] linking"
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/config/alacritty/alacritty.yml  ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/config/neofetch/config.conf  ~/.config/neofetch/config.conf

# clone syntax highlight and autosuggestions plugins for zsh
echo "[INFO] installing zsh plugins and fzf"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

# download fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

# installing fzf
~/.fzf/install --all

#installing jedi for python autocompletion
pip3 install jedi
pip3 install -U jedi-language-server

echo "[INFO] installing vim plugins"

nvim -E +PlugInstall +qall || true

echo "[INFO] Done"
