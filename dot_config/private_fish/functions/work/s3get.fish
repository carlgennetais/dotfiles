function s3get --description "Browse and download a file from an S3 bucket"
    argparse --name=s3get 'h/help' -- $argv
    or return

    if set -q _flag_help; or test (count $argv) -lt 2
        echo "Usage: s3get <bucket> <download-dir>"
        return 1
    end

    set -l path $argv[1]
    set -l dest $argv[2]

    if not test -d "$dest"
        echo "Error: $dest is not a directory"
        return 1
    end

    set -l bucket (string replace -r '/.*' '' "$path")
    set -l key (aws s3 ls "s3://$path" --recursive | string replace -r '^\S+\s+\S+\s+\S+\s+' '' | fzf --tac --prompt="$path> ")

    if test -z "$key"
        echo "No file selected"
        return 1
    end

    aws s3 cp "s3://$bucket/$key" "$dest/"
end
