cd .local/share/fonts
mkfontdir
mkfontscale
sudo apt-get install git
git clone https://github.com/junglistmissive/dotfiles.git
mv dotfiles/* dotfiles/.* .
cd dotfiles
ls
ls -a
.config
cd .config
ls
mv * ~/.config
mv --force * ~/.config
mv --force * ~/.configcd openbox
cd openbox
ls
mv --force autostart environment menu.xml rc.xml ~/.config/openbox
cd ..
ls
ls -a
cd openbox
ls
..
cd ll
cd ..
ls
ls -a
cd .local
ls
cd share
ls
mv fonts ~/.local/share
cd ..
cd .themes
ls
mv panic ~/.themes
sudo apt-get install zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
mkdir .cache/squash
mkdir ~/.cache/squash
mkdir .config/nvim/autoload
mkdir ~/.config/nvim/autoload
mv ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/
mkdir ~/.antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh
sudo apt-get install rofi lemonbar
sudo apt-get install rxvt-unicode
sudo apt-get install xset
sudo apt-get install x11-xserver-utils
sudo apt-get install hsetroot
xset fp+ ~/.local/share/fonts
xset fp rehash
fc-cache
sudo chsh daniel
homeshick generate dotfiles
exit
