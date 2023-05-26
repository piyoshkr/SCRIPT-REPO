#!/bin/bash

# Set variables
username="piyoshkr"
repository="script-repo"
urls="https://api.github.com/repos/$username/$repository/releases/latest"
# Get the latest version number
echo $urls
version=$(curl -s $urls | grep -oP '"tag_name": "\K(.*)(?=")')
echo $version
# Check if the latest version is already downloaded
if [ -d "$repository-$version" ]; then
    echo "Latest version already downloaded."
else
# Download the latest version
echo "Downloading latest version..."
curl -sL "https://github.com/$username/$repository/archive/refs/tags/$version.tar.gz" | tar xz
echo "Latest version downloaded."
fi

# Pull changes if the repository already exists
if [ -d "$script-repo" ]; then
    cd "$script-repo"
    git pull
    echo "Repository updated to latest version."
fi

