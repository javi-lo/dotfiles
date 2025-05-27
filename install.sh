# install .zshrc
cp zshrc ~/.zshrc

# install .tmux.conf
cp tmux.conf ~/.tmux.conf

# install nvim configs
mkdir -p ~/.config
cp -r nvim ~/.config/nvim

# install tmux theme
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

# install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
