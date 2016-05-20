tests:ensure tmux:send "$_tmux_session" "echo 1" "enter"

tests:ensure tmux:cat-screen "$_tmux_session"
tests:assert-stdout 'echo 1'

tests:ensure tmux:cat-screen "$_tmux_session" '|' head -n2 '|' tail -n1
tests:assert-stdout-re '^1$'
