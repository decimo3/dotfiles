# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias speak="speak-ng -v mb/mb-br4 -s 124 -a 100"
alias poweroff="systemctl poweroff"
alias abnt2="setxkbmap -model abnt2 -layout br -variant abnt2"
alias update="sudo ntpdate -u time.cloudflare.com"
alias onedrive="onedrive --synchronize"
alias mine="minetest --server --worldname 'mundo novo'"
alias disk="ncdu $HOME"
alias build="dotnet publish -r linux-x64 --no-self-contained /p:PublishSingleFile=true"
alias ls="exa -la --icons --group-directories-first"
alias cat="bat"
alias xclip="xclip -selection c"
alias token="sudo cat ~/token | xclip -selection c"

#xmodmap -e "pointer = 1 3 2"

function upper() {
  echo "$1" | tr a-z A-Z
}
function light () {
  DEV=`brightnessctl -l | grep -Eom 1 "[0-9]{1,3}"`
  brightnessctl -d 'input'$DEV'::scrolllock' set $1
}
function backup () {
  rsync -av "/run/media/$USER/$1/" "$HOME/Backup/$1"
}
function fmount () {
  sudo mkdir "/run/media/$USER"
  sudo mkdir "/run/media/$USER/$1"
  sudo mount "/dev/$1" "/run/media/$USER/$1"
}
function install () {
  sudo "$HOME/Downloads/NVIDIA-Linux-x86_64-390.147.run"
}
function dotfiles () {
#  if "$1" -eq "--reverse"
#  then
#    CASA="$HOME/Documents/Development/dotfiles"
#    REPO="$HOME"
#  else
    CASA="$HOME"
    REPO="$HOME/Documents/Development/dotfiles"
#  fi
  cp -u "$CASA/.gitconfig" "$REPO/.gitconfig"
  cp -u "$CASA/.nvidia-settings-rc" "$REPO/.nvidia-settings-rc"
  cp -u "$CASA/.p10k.zsh" "$REPO/.p10k.zsh"
  cp -u "$CASA/.profile" "$REPO/.profile"
  cp -u "$CASA/.tool-versions" "$REPO/.tool-versions"
  cp -u "$CASA/.vuerc" "$REPO/.vuerc"
  cp -u "$CASA/.xbindkeysrc" "$REPO/.xbindkeys"
  cp -u "$CASA/.Xmodmap" "$REPO/.Xmodmap"
  cp -u "$CASA/.zshrc" "$REPO/.zshrc"
  cp -u "$CASA/setup.sh" "$REPO/setup.sh"
  cp -u "$CASA/.bashrc" "$REPO/.bashrc"
}
function newerthat () {
  if "$1" -nt "$2"
  then
    echo "$1 is newer that $2"
  else
    echo "$1 is older that $2"
  fi
}
# fmount 16E06587E0656DC5
export PATH=$PATH:$HOME/.asdf/installs/rust/1.58.1/bin
export PATH=$PATH:$HOME/Aplications/apacheMaven/bin
export PATH=$PATH:/opt/gradle/bin
. ~/.asdf/asdf.sh
. ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh
. ~/.asdf/plugins/java/set-java-home.zsh
abnt2
light 1
xbindkeys
