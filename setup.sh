#!/bin/bash
sudo pacman -S git zsh brightnessctl wine dlang-dmd chromium
cd /tmp
mkdir Projects
cd Projects
onedrive () {
  git clone https://github.com/skilion/onedrive.git onedrive
  cd onedrive
  make
  sudo make install
  systemctl --user enable onedrive
  systemctl --user start onedrive
  cd ..
}
asdf () {
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
  echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
}
powerlevel10k () {
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
  echo "source $HOME/.powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
}
source ~/.zshrc
