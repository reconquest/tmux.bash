#!/bin/bash

set -euo pipefail

_base_dir=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
source "$_base_dir/vendor/github.com/reconquest/test-runner.bash/test-runner.bash"

_tmux_session="tmux-test-$RANDOM"

:cleanup() {
    tmux kill-session -t "$_tmux_session"
}

trap ":cleanup" EXIT

test-runner:run "${@}"

:cleanup
