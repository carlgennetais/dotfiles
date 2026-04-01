function ssh -d "Highlight tmux pane when connecting via ssh"
    if test -n "$TMUX"
        tmux select-pane -P bg='#511512'
    end
    command ssh $argv
end