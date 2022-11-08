#/bin/env bash

source $(dirname "$0")/utils.sh

choose_demo

# clean
git restore --staged .
git checkout .
git clean -f

# switch to main and delete all other
git checkout main
git branch | grep -v \* | xargs git branch -D || echo "No branches deleted"

# now list the branches for the demo
branches=$(git tag -l "demo/${demo}/*" | grep -oP "^demo/${demo}/\K.*" | uniq)

IFS=$'\n'
branches=($branches)

echo "Setting up branches: ${branches[@]}"

for branch in "${branches[@]}"; do
    if [[ $branch == "main" ]]; then
        git checkout main
        git reset --hard "demo/${demo}/${branch}"
    else
        echo "git checkout -b $branch \"demo/${demo}/${branch}\""
        git checkout -b $branch "demo/${demo}/${branch}"
    fi
done

# switch to main
git checkout main