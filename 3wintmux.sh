i#!/bin/bash

tmux new-session -d -s 3win

# Create a large window pane on the left
tmux split-window -h -p 8

# Send command to watch GPU usage
tmux send-keys "watch -n 1 nvidia-smi" Enter

# Split the remaining space vertically and creat two stacked window panes
tmux split-window -v -p 50

# Send command to watch computer usage
tmux send-keys "htop" Enter

# Select main pane
tmux select-pane -t 3win:0.0


tmux attach-session -t 3win
