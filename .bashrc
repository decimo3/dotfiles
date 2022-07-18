#
# ~/.bashrc
#
echo "Realizando backup dos dotfiles..."
cp ~/.bashrc ~/OneDrive/dotfiles/
cp ~/.vimrc ~/OneDrive/dotfiles/
echo "Iniciando servidor LAMPP..."
sudo /opt/lampp/lampp start
echo "Modificando os botões do mouse..."
xmodmap -e "pointer = 1 3 2"
echo "Modificando o layout do teclado..."
setxkbmap -model abnt2 -layout br -variant abnt2
echo "Keyboard as setup to anbt2"
# The default variable for read to store the result in is $REPLY if you don't supply a name like this: read -p "my prompt" -n 1 -r my_var
# _read_ command outputs the prompt (-p "prompt") then accepts one character (-n 1) and use a raw string (-r).
# The regular expression used here says "a string starting (^) and consisting solely of one of a list of characters in a bracket expression ([Yy]) and ending ($)".
# The if statement uses a regular expression to check if the character in $REPLY matches (=~) an upper or lower case "Y".
read -p "É necessária a atualização da hora do sistema?" -n 1 -r
if [[ $REPLY =~ ^[YySs]$ ]]
then
	sudo ntpdate -u time.cloudflare.com
fi
echo ""
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet
echo "Atualizando arquivos do Onedrive..."
onedrive
echo "Iniciando servidor de editor do VS Code"
code-server
