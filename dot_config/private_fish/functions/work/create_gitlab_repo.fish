function create_gitlab_repo
    set ORGANIZATION_FLAG false
    set -l POSITIONAL_ARGS

    while test (count $argv) -gt 0
        switch $argv[1]
            case -o --organization
                set ORGANIZATION_FLAG true
            case '*'
                echo "Unknown option $argv[1]"
                exit 1
        end
        set -e argv[1]
    end

    set project_name (basename $PWD)
    read -p "Repo description: " description
    echo "Create repo $project_name with description $description"

    if test "$ORGANIZATION_FLAG" = true
        glab repo create $project_name -g dev1451846/data --private -d "$description"
        set repo_url "https://gitlab.com/dev1451846/data/$project_name.git"
    else
        glab repo create $project_name --private -d "$description"
        set repo_url "https://gitlab.com/cgennetais-dynabuy/$project_name.git"
    end

    sleep 2
    git remote add origin $repo_url
    xdg-open $repo_url
end
