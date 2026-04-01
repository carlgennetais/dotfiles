function new_byobu_windows -d "Create tmux windows for DDP project (nvim, lazydocker, ssh)"
    tmux new-window -n '∟ DDP' 'cd /home/carl/Projets/2025_dynabuy_data_platform/dynabuy_data_platform/ && nvim .'
    tmux new-window -n '⌬ docker' 'cd /home/carl/Projets/2025_dynabuy_data_platform/dynabuy_data_platform/ && lazydocker'
    tmux new-window -n '⍲ SSH' 'ssh ddp_prod'
    tmux select-window -t '∟ DDP'
end