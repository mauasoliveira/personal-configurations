#!/bin/bash

# Define source and target directories
source_dir="./config"
target_dir="$HOME/.config"

# Function to create hard links, preserving directory structure
create_links() {
    local src="$1"
    local tgt="$2"

    find "$src" -type d | while read -r dir; do
        mkdir -p "$tgt/${dir#$src/}"
    done

    find "$src" -type f | while read -r file; do
        echo "$tgt/${file#$src/}"
	rm -f "$tgt/${file#$src/}"
        ln "$file" "$tgt/${file#$src/}"
    done
}

# Call the function with source and target directories
create_links "$source_dir" "$target_dir"

