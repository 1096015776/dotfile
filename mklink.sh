#copy config dir
cd ~/.config
rm -rf fd lazygit nvim ranger ripgrep tmux
ln -s ~/dotfile/.config/fd ~/.config/fd
ln -s ~/dotfile/.config/lazygit ~/.config/lazygit
ln -s ~/dotfile/.config/nvim ~/.config/nvim
ln -s ~/dotfile/.config/ranger ~/.config/ranger
ln -s ~/dotfile/.config/ripgrep ~/.config/ripgrep
ln -s ~/dotfile/.config/tmux ~/.config/tmux

# copy zsh config
cd ~
rm -rf .zshrc .zshenv .p10k.zsh
ln -s ~/dotfile/.zshrc ~/.zshrc
ln -s ~/dotfile/.zshenv ~/.zshenv
ln -s ~/dotfile/.p10k.zsh ~/.p10k.zsh
