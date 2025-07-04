# zshrc
sed -i '/^source .*\/config\/zshrc%/d' ~/.zshrc

# neovim
rm ~/.config/nvim
rm -rf ~/.local/share/nvim

# tmux
rm ~/.tmux.conf
rm -rf ~/.config/tmux
