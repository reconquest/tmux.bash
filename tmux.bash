tmux:cat-screen() {
    local session=$1
    shift

    tmux capture-pane "-pt" "$session" "${@:--e}"
}

tmux:new-session() {
    local session=$1
    shift

    tmux new-session -ds "$session" "${@}"
}

tmux:kill-session() {
    local session=$1
    shift

    tmux kill-session -t "$session"
}

tmux:has-session() {
    local session=$1
    shift

    tmux has-session -t "$session"
}

tmux:send-raw() {
    local session=$1
    shift

    tmux send-keys -t "$session" -l "${@}"
}

tmux:send() {
    local session=$1
    shift

    tmux send-keys -t "$session" "${@}"
}

tmux:wait-sync() {
    local session=$1
    local timeout=$2
    shift 2

    while [ "$1" != "--" ]; do
        tmux:send "$session" "$1"
        shift
    done

    shift

    trials=$(($timeout * 10))
    while [ "$trials" -gt 0 ]; do
        if "${@}"; then
            return 0
        fi

        trials=$(($trials-1))

        sleep 0.1
    done

    if [ $trials -le 0 ]; then
        printf "tmux sync is timed out\n" >&2
        return 1
    fi

    return 0
}

