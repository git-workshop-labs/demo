#!/bin/env bash

set -e

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
list_demo_commits "${demo}"

for commit in "${commits[@]}"; do
    get_demo_commit_branch "${demo}" "${commit}"
    echo "Setting up branch ${branch} on commit ${commit}"
    if [[ $branch == "main" ]]; then
        git checkout main
        git reset --hard $commit
    else
        echo "git checkout -b $branch $commit"
        git checkout -b $branch $commit
    fi
done

# switch to main
git checkout main

reset
