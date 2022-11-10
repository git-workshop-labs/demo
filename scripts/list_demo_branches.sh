#!/bin/env bash

source $(dirname "$0")/utils.sh

choose_demo

echo "Listing branches for '${demo}'"

list_demo_commits "${demo}"

for commit in "${commits[@]}"; do
    get_demo_commit_branch "${demo}" "${commit}"
    echo $branch
done
