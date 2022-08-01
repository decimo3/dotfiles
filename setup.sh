#!/bin/bash

# Install basic programs
sudo pacman -S git zsh brightnessctl wine chromium sublime-text-dev

# Install asdf-vm for language download
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 && echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc

# Install programming language 'DMD compiler'
asdf plugin-add dmd https://github.com/sylph01/asdf-dmd.git && asdf install dmd latest && asdf global dmd latest

# Install programming language 'NodeJS'
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git && asdf install nodejs latest && asdf global nodejs latest

# Install PowerLevel10k command line theme for zshell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k && echo "source $HOME/.powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc

# Install OneDrive client for linux
git clone https://github.com/skilion/onedrive.git onedrive && cd onedrive && make && sudo make install && systemctl --user enable onedrive && systemctl --user start onedrive

# Install LunarVim
source ~/.zshrc
