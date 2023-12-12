#!/usr/bin/bash
# build/nr-gnb -c config/free5gc-gnb.yaml &
# gNB_pid=$!

# sleep 1

# sudo build/nr-ue -c config/free5gc-ue.yaml &
# UE_pid=$!

# sleep 1

SESSION="CH"
tmux new-session -d -s $SESSION
tmux rename-window -t $SESSION:0 'Main'
tmux split-window -h -p 50 -t $SESSION:Main
tmux split-window -v -p 50 -t $SESSION:Main
tmux split-window -v -p 50 -t $SESSION:Main
tmux select-pane -t $SESSION:Main -U
tmux select-pane -t $SESSION:Main -U
tmux split-window -v -p 50 -t $SESSION:Main
tmux select-pane -t $SESSION:Main -L
tmux split-window -v -p 50 -t $SESSION:Main
tmux split-window -v -p 50 -t $SESSION:Main
tmux select-pane -t $SESSION:Main -U
tmux select-pane -t $SESSION:Main -U
tmux split-window -v -p 50 -t $SESSION:Main
# tmux send-keys -t $SESSION:Main 'ping 8.8.8.8' C-m
# tmux send-keys -t $SESSION:Main 'tmux detach' C-m
tmux select-pane -t $SESSION:Main -U
tmux send-keys -t $SESSION:Main 'build/nr-gnb -c config/free5gc-gnb.yaml' C-m
tmux select-pane -t $SESSION:Main -R
tmux send-keys -t $SESSION:Main 'sudo build/nr-ue -c config/free5gc-ue.yaml' C-m
tmux select-pane -t $SESSION:Main -L
tmux select-pane -t $SESSION:Main -D
sleep 2
tmux send-keys -t $SESSION:Main 'ping -s 92 -c 20 -I uesimtun0 10.10.0.84' C-m
tmux select-pane -t $SESSION:Main -R
tmux send-keys -t $SESSION:Main 'ping -s 102 -c 20 -I uesimtun0 10.10.0.85' C-m
tmux select-pane -t $SESSION:Main -D
tmux send-keys -t $SESSION:Main 'ping -s 122 -c 20 -I uesimtun1 10.10.0.85' C-m
tmux select-pane -t $SESSION:Main -L
tmux send-keys -t $SESSION:Main 'ping -s 112 -c 20 -I uesimtun1 10.10.0.84' C-m
tmux select-pane -t $SESSION:Main -D
tmux send-keys -t $SESSION:Main 'ping -s 132 -c 20 -I uesimtun0 9.9.9.9' C-m
tmux select-pane -t $SESSION:Main -R
tmux send-keys -t $SESSION:Main 'ping -s 142 -c 20 -I uesimtun1 9.9.9.9' C-m
tmux attach -t $SESSION

tmux kill-session -t $SESSION
# ping -s 92 -c 100 -I uesimtun0 10.10.0.84 &
# sleep 1
# ping -s 92 -c 100 -I uesimtun0 10.10.0.85 &

# sleep 100

# ps aux | grep "build/nr-gnb" | awk '{print $2}' | sudo kill `xargs`

# sleep 1
# ps aux | grep "build/nr-ue" | awk '{print $2}' | sudo kill `xargs`




