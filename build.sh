#!/usr/bin/env nix-shell
#!nix-shell --quiet -i bash -p nix-output-monitor

# Function to retry a command until it succeeds or reaches the maximum number of tries
MAX_TRIES=5
try() {
    local tries=0
    until $@; do
        tries=$((tries + 1))
        if [ $tries -ge $MAX_TRIES ]; then
            return 1
        fi
        sleep 1
    done
}

# Stage all changes and commit
try git add .
try git commit -q --allow-empty -m "PREBUILD"

# Run nix flake check and capture its output
output=$(nix flake check --impure --log-format internal-json -v |& nom --json)

# If nix flake check fails, undo the commit, unstage the changes, and exit
if [ $? -ne 0 ]; then
    try git reset -q HEAD~
    exit 1
fi

# Get the new current generation
new_generation=$(get_current_generation)

# Push changes
try git push -q origin

exit 0