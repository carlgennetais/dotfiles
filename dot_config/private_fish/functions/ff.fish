function ff -d 'Search home directory for folders and cd into selected one (fzf + fd)'
    set -l dir (fd . --hidden --type=d -L ~ | fzf --border=rounded)
    if test -n "$dir"
        cd "$dir"
    end
end

