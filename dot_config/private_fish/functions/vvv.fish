function vvv -d "Search files in home and cd into parent directory of selected file"
    set -l f (fd . --hidden --type=f -L ~ | fzf --border=rounded --preview 'batcat -n --color=always {}')
    if test -n "$f"
        set -l dir (dirname "$f")
        cd "$dir"
        echo "Changed to directory: $dir"
    end
end