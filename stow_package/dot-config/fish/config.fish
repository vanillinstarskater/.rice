if status is-interactive
    function fish_greeting
        abbr --add "vi" "nvim"
        abbr --add "cl" "clear"
        abbr --add "la" "ls -Al"

        abbr --add "sk" "python ~/.rice/assets/sk.py"
        abbr --add "skd" "python ~/.rice/assets/skd.py"
        abbr --add "skdn" "python ~/.rice/assets/skdn.py"
        abbr --add "skl" "python ~/.rice/assets/skl.py"
    end

    function fish_prompt
        set -l last_status $status
        echo -s (set_color green)"["$USER"@"(prompt_hostname)":"(prompt_pwd)"]"(set_color --reset)"-"(set_color red)"["$last_status"]"(set_color blue) (fish_git_prompt) (set_color purple)"<"$CMD_DURATION"ms>"
        echo -n '> '
    end
end
