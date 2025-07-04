# zshrc
sed -i '' '/^source .*\/config\/zshrc$/d' ~/.zshrc

# neovim
unlink ~/.config/nvim
rm -rf ~/.local/share/nvim

# tmux
unlink ~/.tmux.conf
rm -rf ~/.config/tmux
