# zshrc
echo "source $PWD/config/zshrc" >> ~/.zshrc

# neovim
ln -s $PWD/plugins/nvim ~/.config/nvim

# tmux
ln -s $PWD/config/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
