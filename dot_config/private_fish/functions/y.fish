function y -d "Yazi file manager - cd into directory on exit"
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    set -l cwd (cat "$tmp" | tr -d '\0')
    if test "$cwd" != "$PWD" -a -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end