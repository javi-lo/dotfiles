# .zshrc setup
cat << 'EOF' >> ~/.zshrc
autoload -Uz compinit && compinit

alias build="cmake -B build && cmake --build build"
alias clean="git clean -dfX"
alias cleaner="git clean -dfx"
EOF

# .tmux.conf setup
cat << 'EOF' >> ~/.tmux.conf
# use vim key bindings
set-window-option -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# catpuccin colorscheme
set -g default-terminal "tmux-256color"

# Configure the catppuccin plugin
set -g @catppuccin_flavor "mocha"
set -g @catppuccin_window_status_style "basic"
set -g @catppuccin_window_text " #W"
set -g @catppuccin_window_current_text " #W"

run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux

set -g status-right-length 100
set -g status-left-length 100
set -g status-left ""
set -g status-right "%l:%M %p   %b %e, %Y"
EOF

# install nvim configs
mkdir -p ~/.config
cp -r nvim ~/.config/nvim

# install tmux theme
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

