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
dots
cd dots
sudo pacman -S zsh
wpa_cli -i wlp1s0
wpa_supplicant -B -i wlp1s0 -c /etc/wpa_supplicant/wpa_supplicant.conf 
sudo wpa_supplicant -B -i wlp1s0 -c /etc/wpa_supplicant/wpa_supplicant.conf 
wpa_cli
sudo wpa_cli
sudo wpa_cli -i wlp1s0
ping archlinux.org
dhcpcd wlp1s0
sudo dhcpcd wlp1s0
sudo pacman -S zsh
sudo pacman -S w3m
sudo pacman -S ImageMagick
sudo pacman -S imagemagick
ls
stow bin
sudo pacman -S stow
stow bin
stow antigen
stow bash
rm ~/.bashrc ~/.bash_logout ~/.bash_history
stow bash
stow bspwm
stow compton
stow freshcoat
stow fzf
stow mopidy
stow ncmpcpp
stow neofetch
stow neovim
stow newsboat
stow rofi
stow sxhkd
stow xconfs
stow zsh
stow .local
cd
ls -a
mv share ~/.local
.local
cd .local
ls
cd share
ls
cd
dots
cd dots
cp -r .themes ~/
ls -a
..
cd
ls -a
cd .local
cd share
ls
..
cd
git clone https://aur.archlinux.org/yay.git
cd yay
sudo pacman -S base-devel
sudo pacman -S go
makepkg -si
yay lemonbar
sudo pacman -S neovim
sudo nvim /etc/pacman.conf
yay lemonbar
sudo pacman -Syyu
..
cd
sudo chsh daniel
logout
