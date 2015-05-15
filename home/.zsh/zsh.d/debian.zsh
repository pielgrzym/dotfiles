alias upgrade="sudo apt-get update && sudo apt-get upgrade"
alias update="sudo apt-get update"
alias aptf="apt-cache search"

mks() {
  # set window title
  session_name="$1"
  printf "\033];%s\07\n" "tmux_session_$session_name"
  if (tmux has-session -t "$session_name" 2> /dev/null); then
    tmux attach-session -t $session_name
  else
    _make_tmux_session $session_name
  fi
}

_make_tmux_session() {
  $session_name="$1"
  case $session_name in
    main)
      _main_tmux_session
      ;;
    logs)
      _logs_tmux_session
      ;;
  esac
  tmux -2 attach-session -t $session_name
}

_main_tmux_session() {
  session_name="main"
  tmux -2 new-session -d -s $session_name -c "$HOME/gtd" -A -n "GTD"
  tmux select-pane -t 0
  if [[ -d $HOME/.vimsessions && -f $HOME/.vimsessions/gtd ]]; then
    tmux send-keys "vim -S $HOME/.vimsessions/gtd" C-m
  else
    tmux send-keys "vim" C-m
  fi
  tmux new-window -t $session_name:1 -n 'dn' -c "$HOME/downloads"
  tmux select-window -t $session_name:0
}

_logs_tmux_session() {
  session_name="logs"
  tmux -2 new-session -d -s $session_name -c "/var/log" -A -n "syslog/dmesg"
  tmux select-pane -t 0
  tmux send-keys "tail -F /var/log/syslog" C-m
  tmux split-window -h
  tmux send-keys "tail -F /var/log/dmesg" C-m
  # Xorg.0.log
  tmux new-window -t $session_name:1 -n 'Xorg.0.log' -c '/var/log'
  tmux select-pane -t 1
  tmux send-keys "tail -F /var/log/Xorg.0.log" C-m
  # auth log
  tmux new-window -t $session_name:2 -n 'auth.log' -c '/var/log'
  tmux select-pane -t 2
  tmux send-keys "tail -F /var/log/auth.log" C-m
  # apt log
  tmux new-window -t $session_name:3 -n 'apt.log' -c '/var/log'
  tmux select-pane -t 3
  tmux send-keys "tail -F /var/log/apt/history.log" C-m
  tmux split-window -h
  tmux send-keys "tail -F /var/log/apt/term.log" C-m
  tmux select-window -t $session_name:0
}

alias main="mks main"
alias logs="mks logs"
