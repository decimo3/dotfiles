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
  ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
  source ~/.zshrc
}


