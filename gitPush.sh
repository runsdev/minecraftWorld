#!/bin/bash

# Variables
WORLD_DIR="."
BRANCH="fabric-save"
REMOTE="origin"
REPO_URL="https://github.com/runs664/minecraftWorld.git"

# Navigate to the Minecraft world directory
cd "$WORLD_DIR" || exit

# Initialize Git repository if not already initialized
if [ ! -d ".git" ]; then
    git init
fi

# Add .gitignore file if not already present
if [ ! -f ".gitignore" ]; then
    echo "*.log" > .gitignore
    echo "logs/" >> .gitignore
    echo "crash-reports/" >> .gitignore
    echo "cache/" >> .gitignore
    echo "resourcepacks/" >> .gitignore
    git add .gitignore
    git commit -m "Add .gitignore"
fi

# Add all changes to the repository
git add .

# Get current date and time in Indonesian format (GMT+7)
commit_date=$(date +"%A, %d %B %Y : %H.%M.%S WIB" | sed 's/Minggu/Senin/' | sed 's/Tuesday/Selasa/' | sed 's/Wednesday/Rabu/' | sed 's/Thursday/Kamis/' | sed 's/Friday/Jumat/' | sed 's/Saturday/Sabtu/')

# Commit changes with a message
git commit -m "save: $commit_date"

# Add remote repository if not already added
if ! git remote | grep -q "$REMOTE"; then
    git remote add "$REMOTE" "$REPO_URL"
fi

# Push changes to the specified branch on the remote repository
git push -u "$REMOTE" master:"$BRANCH"

