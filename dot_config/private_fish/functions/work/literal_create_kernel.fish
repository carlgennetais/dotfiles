function create_kernel -d "Create a Jupyter kernel for the current project"
    set projet_name (basename $PWD)
    source .venv/bin/activate.fish
    # create jupyter kernel for this project
    python -m ipykernel install --user --name $projet_name
end
