#!/bin/bash

# Check for untracked files
if [ -n "$(git ls-files --others --exclude-standard)" ]; then
    echo "Untracked files found. Staging all changes..."
    git add .
else
    echo "No untracked files found. Skipping git add."
fi

# Ask for commit message
read -p "Enter commit message: " commit_msg

# Commit
if git commit -m "$commit_msg"; then
    echo "Commit successful."
else
    echo "Commit failed. Nothing to commit?"
    exit 1
fi

# Push
if git push; then
    echo "Push successful."
else
    echo "Push failed."
    exit 1
fi