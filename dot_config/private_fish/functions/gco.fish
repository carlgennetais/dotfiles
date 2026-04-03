function gco -d "git checkout with fzf"
    set ref (__fzf_git_sh each_ref --no-multi)
    and git checkout $ref
end
