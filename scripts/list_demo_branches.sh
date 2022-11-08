#!/bin/env bash

source $(dirname "$0")/utils.sh

choose_demo

echo "Listing branches for '${demo}'"

branches=$(git tag -l "demo/${demo}/*" | grep -oP "^demo/${demo}/\K.*" | uniq)

echo $branches