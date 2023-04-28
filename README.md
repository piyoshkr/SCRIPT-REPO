#!/bin/bash

# Change these variables to match your repository
username="piyoshkr"
repository="script-repo"

# Make a request to the GitHub API to get the latest release
response=$(curl -s "https://api.github.com/repos/$username/$repository/releases/latest")

# Parse the response using jq and get the tag name of the latest release
latest_version=$(echo "$response" | jq -r ".tag_name")

echo "Latest version: $latest_version"


