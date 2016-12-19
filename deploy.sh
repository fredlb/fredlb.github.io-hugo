#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo --theme=hyde-y # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
git subtree push --prefix=public git@github.com:fredlb/fredlb.github.io.git master 

# Come Back
cd ..
