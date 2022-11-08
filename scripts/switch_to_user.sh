#!/bin/env bash

source $(dirname "$0")/utils.sh

user=(
 "wayne"
 "nathan"
 "julian"
)

choose_from_menu "Select new user:" selected_user "${user[@]}"

case $selected_user in
  nathan)
    echo "Switching to Nathan Hüsken"
    git config --global user.name "Nathan Hüsken"
    git config --global user.email "nathan@wintercloud.de"
    ;;
  wayne)
    echo "Switching to Wayne Götz"
    git config --global user.name "Wayne Götz"
    git config --global user.email "wayne@wintercloud.de"
    ;;
  julian)
    echo "Switching to Julian Wintermayr"
    git config --global user.name "Julian Wintermayr"
    git config --global user.email "julian@wintercloud.de"
    ;;
esac