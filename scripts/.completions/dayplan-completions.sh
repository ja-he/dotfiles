_dayplan_completion() {
    args=("${COMP_WORDS[@]:1:$COMP_CWORD}")

    local IFS=$'\n'

    COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
    return 0
}

complete -F _dayplan_completion dayplan
