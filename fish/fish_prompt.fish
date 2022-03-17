function fish_prompt -d "Fishbone custom prompt"

    # Keep the command executed status
    set --local last_status $status

    show_path
end

function show_path -d "Prints current directory abbreviated"

    set_color blue
    echo -en "["

    set_color yellow
    #echo -en (prompt_pwd)

    #if [ (echo "$HOME") == (basename (pwd)) ]
    #    echo -en "~"
    #else
        echo -en (basename (pwd))
    #end

    set_color blue
    echo -en "] "

    set_color normal
end

function fish_right_prompt -d "Right side prompt message"

    # Keep the command executed status
    set --local last_status $status

    # A dark grey
    set --local dark_grey 555

    set_color $dark_grey

    show_time $last_status
    echo " "
    show_git_info

    set_color normal
end

function show_time -a last_status -d "Show time"
    set --local current_color green

    if [ $last_status -ne 0 ]
        set current_color red
    end

    set_color $current_color
    echo -en (date +%H:%M:%S)
    set_color normal
end

function show_git_info -d "Show git repository information"
    set_color blue

    set --local git_status (git status 2> /dev/null)
    set --local dirty ""

    if [ -z "$git_status" ]
        return  # Not a repository? Nothing to do
    end

    set --local git_branch_name (git rev-parse --abbrev-ref HEAD)

    # If there is modifications, set repository dirty to '*'
    if ! [ -z (echo "$git_status" | grep -e '^ M') ]
        set dirty "*"
    end

    # If there is new or deleted files, add  '+' to dirty
    if ! [ -z (echo "$git_status" | grep -e '^[MDA]') ]
        set dirty "$dirty+"
    end

    # If there is stashed modifications on repository, add '^' to dirty
    #if ! [ -z (git stash list) ]
    #    set dirty "$dirty^"
    #end

    # Prints git repository status
    echo -en "$git_branch_name $dirty"

    set_color normal
end

