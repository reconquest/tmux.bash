tests:ensure tmux:has-session "$_tmux_session"
tests:ensure tmux:kill-session "$_tmux_session"

tests:not tests:ensure tmux:has-session "$_tmux_session"
tests:not tests:ensure tmux:kill-session "$_tmux_session"
