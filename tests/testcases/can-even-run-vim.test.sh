tests:ensure tmux:send "$_tmux_session" "vim -u NONE -U NONE" "enter"
tests:ensure tmux:send "$_tmux_session" "i"
tests:ensure tmux:send-raw "$_tmux_session" "escape 123"
tests:ensure tmux:send "$_tmux_session" "escape" ":" "w "
tests:ensure tmux:send-raw "$_tmux_session" "$(tests:get-tmp-dir)/file"

tests:eval tmux:wait-sync "$_tmux_session" 1 "enter" -- test -e "file"

tests:ensure tmux:kill-session "$_tmux_session"
