#!/bin/bash

# Install basic programs
sudo pacman -S git zsh brightnessctl wine chromium sublime-text-dev neovim xclip make

# Install asdf-vm for language download
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 && echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc

# Install programming language 'DMD compiler'
asdf plugin-add dmd https://github.com/sylph01/asdf-dmd.git && asdf install dmd 2.100.0 && asdf global dmd 2.100.0

# Install programming language 'NodeJS'
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git && asdf install nodejs 18.7.0 && asdf global nodejs 18.7.0

# Install programming language 'Rust'
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git && asdf install rust 1.62.1 && asdf global rust 1.62.1 && echo "export PATH=$PATH:$HOME/.asdf/installs/rust/1.62.1/bin"

# Install programming language 'Python'
asdf plugin-add python https://github.com/danhper/asdf-python.git && asdf install python 3.10.5 && asdf global python 3.10.5

# Install PowerLevel10k command line theme for zshell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k && echo "source $HOME/.powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc

# Install OneDrive client for linux
git clone https://github.com/skilion/onedrive.git ~/Documents/Development/onedrive && cd ~/Documents/Development/onedrive && make && sudo make install && systemctl --user enable onedrive && systemctl --user start onedrive && mkdir -p ~/.config/onedrive && cp ./config ~/.config/onedrive/config && cd ~

# Install LunarVim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y

source ~/.zshrc
