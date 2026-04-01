function vv -d "Search files in home and open with appropriate app (open/vd/nvim based on extension)"
    set -l f (fd . --hidden --type=f -L ~ | fzf --border=rounded --preview 'batcat -n --color=always {}')
    if test -n "$f"
        if string match -q '*.pdf' $f
            or string match -q '*.png' $f
            or string match -q '*.ods' $f
            or string match -q '*.jpg' $f
            or string match -q '*.jpeg' $f
            or string match -q '*.ipynb' $f
            or string match -q '*.html' $f
            open "$f"
        else if string match -q '*.csv' $f
            or string match -q '*.xls' $f
            or string match -q '*.xlsx' $f
            vd "$f"
        else
            nvim "$f"
        end
    end
end