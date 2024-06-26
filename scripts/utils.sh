# exmaple usage:
# selections=(
# "Selection A"
# "Selection B"
# "Selection C"
# )
#
# choose_from_menu "Please make a choice:" selected_choice "${selections[@]}"
# echo "Selected choice: $selected_choice"

function choose_from_menu() {
    local prompt="$1" outvar="$2"
    shift
    shift
    local options=("$@") cur=0 count=${#options[@]} index=0
    local esc=$(echo -en "\e") # cache ESC as test doesn't allow esc codes
    printf "$prompt\n"
    while true
    do
        # list all options (option list is zero-based)
        index=0
        for o in "${options[@]}"
        do
            if [ "$index" == "$cur" ]
            then echo -e " >\e[7m$o\e[0m" # mark & highlight the current option
            else echo "  $o"
            fi
            index=$(( $index + 1 ))
        done
        read -s -n3 key # wait for user to key in arrows or ENTER
        if [[ $key == $esc[A ]] # up arrow
        then cur=$(( $cur - 1 ))
            [ "$cur" -lt 0 ] && cur=0
        elif [[ $key == $esc[B ]] # down arrow
        then cur=$(( $cur + 1 ))
            [ "$cur" -ge $count ] && cur=$(( $count - 1 ))
        elif [[ $key == "" ]] # nothing, i.e the read delimiter - ENTER
        then break
        fi
        echo -en "\e[${count}A" # go up to the beginning to re-render
    done
    # export the selection to the requested output variable
    printf -v $outvar "${options[$cur]}"
}

# list demos into variables "$demos"
function list_demos() {
    demos=$(git log --all --grep='demo//*' | grep 'demo//*' | cut -d '/' -f 2 | sort | uniq)
    IFS=$'\n'
    demos=($demos)
}

# list the commits of a demo
# $0 is supposed to be the demo name
function list_demo_commits() {
    commits=$(git log --all --grep="demo/${1}//*" --pretty=format:'%h')
    IFS=$'\n'
    commits=($commits)
}

function get_demo_commit_branch() {
  branch=$(git show ${2} | grep "demo/${1}//*" | cut -d '/' -f 3)
}

# choose one of the demos
function choose_demo() {
    list_demos
    choose_from_menu "Select Demo:" demo "${demos[@]}"
}
