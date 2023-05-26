#!/bin/bash

# Set the repository owner and name
OWNER="piyoshkr"
REPO="script-repo"

# Get the latest version from the repository
LATEST_VERSION=$(curl -s https://api.github.com/repos/$OWNER/$REPO/releases/latest | jq -r '.tag_name')
echo $LATEST_VERSION
RES=$(cd ~|ls|grep "$REPO"|sed "s/$REPO-//g")
echo $RES
# Compare the latest version with the script version
if [ "$LATEST_VERSION" = "$RES" ] ; then
  echo "The script is up to date."
else
  echo "A new version of the script is available: $LATEST_VERSION"

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

