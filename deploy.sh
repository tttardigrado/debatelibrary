#!/bin/bash
# this script takes on argument corresponding to the git commit message

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# remove old content
rm -rf ./content/tournaments
rm -rf ./content/workshops

# generate new content
debategen

# build the static site with hugo
hugo --minify

# run pagefind to generate the search index
##### TODO:


# push to github and publish to netlify
git add .

msg="update site `date`"
if [ $# -eq 1 ]; then
    msg="$1"
fi
git commit -m "$msg"

git push origin main