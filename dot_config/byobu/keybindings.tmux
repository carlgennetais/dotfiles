
# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator

# decide whether we're in a Vim process
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

# vim shortcuts to switch panes (will override some terminal shortcuts)
bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'

# rebind some terminal shortcuts, adding shift
bind-key -n 'C-S-k' send-keys 'C-k'
bind-key -n 'C-S-l' send-keys 'C-l'

# vim shortcuts to switch windows
bind-key -n 'C-PageDown' if-shell "$is_vim" 'send-keys C-PageDown' 'select-window -t:+1'
bind-key -n 'C-PageUp' if-shell "$is_vim" 'send-keys C-PageUp' 'select-window -t:-1'
bind-key -T copy-mode-vi 'C-h' select-pane -L
bind-key -T copy-mode-vi 'C-j' select-pane -D
bind-key -T copy-mode-vi 'C-k' select-pane -U
bind-key -T copy-mode-vi 'C-l' select-pane -R
bind-key -T copy-mode-vi 'C-PageDown' select-window -t:+1
bind-key -T copy-mode-vi 'C-PageUp' select-window -t:-1


# change default Byobu/tmux prefix (C-a is used in shell to go to begining of line, and in vim to increment)
unbind-key -n C-a
set -g prefix2 F12
set-option -g prefix 'M-Space'

bind-key "r" source-file $BYOBU_PREFIX/share/byobu/profiles/tmuxrc \; display "Reloaded byobu"
bind-key "Space" run-shell -b "/home/carl/.tmux/plugins/tmux-fzf/scripts/pane.sh switch"
bind-key -T prefix b run-shell -b "~/.tmux/plugins/tmux-fzf/main.sh" 
bind-key "`" last-window
bind-key "|"  split-window -h
bind-key "-" split-window -v
