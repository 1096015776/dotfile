# My dotfile

## ![main](resource/img/main.png)

## env

os: wsl + arch<br>
dev: ranger + lazyvim + lazygit<br>
font: [JetBrainsMono](https://www.nerdfonts.com/font-downloads)

## network etc

```shell
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.huaweicloud.com/archlinux/$repo/os/$arch
```

## dep

```shell
# update arch key
pacman -Syyu
pacman-key --init
pacman-key --populate
pacman -Syy archlinux-keyring
# tool
pacman -S lazygit neovim ranger ripgrep fd tmux git-delta zsh npm atool zip unzip neofetch jq
# base dev
pacman -S base-devel openssh
```
## windows register

download [windows](https://github.com/massgravel/Microsoft-Activation-Scripts) version<br>
download [wsl-vpn](https://github.com/sakai135/wsl-vpnkit)

## resource

my wallpaper and windows-terminal config

## tip
I have a mklinks zsh to move dotfile<br>
### search text
```shell
grep -rh '<el-'|awk -F el- '{print $2}'|awk -F ' ' '{print$1}'|sort|uniq
```
