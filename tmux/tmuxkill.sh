×
–
⬈
#!/bin/bash
#
# kill current tmux(inator) session safely
#
# read and parse tmuxinator config
# send keys to panes
# kill session

# Add lines of the following form to tmuxinator config
# # exit: <window> <pane> <keys>...
# e.g. to stop guard in server pane 1, kill the tail in pane 2 and quit vim:
# # exit: server 1 e Enter
# # exit: server 2 C-c
# # exit: editor 1 Escape :q! Enter

SESSION=$(tmux display-message -p "#S")

OIFS=$IFS
IFS=$'\n'

for line in $(grep '^# exit:' ~/.tmuxinator/$SESSION.yml); do
  IFS=' '
  elems=($line)
  window="${elems[2]}"
  pane=${elems[3]}
  unset 'elems[0]'
  unset 'elems[1]'
  unset 'elems[2]'
  unset 'elems[3]'
  cmd="${elems[*]}"
  echo "tmux send-keys -t $SESSION:$window.$pane $cmd"
done
IFS=$OIFS

tmux kill-session
