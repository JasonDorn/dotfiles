#!/bin/bash
# Tmux session setup for Pequity development

SESSION="pequity"
PEQUITY_DIR=~/Developer/pequity

# Check if session already exists
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  # Create new session detached
  tmux new-session -d -s $SESSION -n servers -c $PEQUITY_DIR

  # Window 1: servers (split into Django + Frontend)
  tmux send-keys -t $SESSION:servers "cd $PEQUITY_DIR" C-m
  tmux send-keys -t $SESSION:servers "echo 'Django server - Run: .venv/bin/python manage.py runserver'" C-m
  tmux split-window -h -t $SESSION:servers -c $PEQUITY_DIR
  tmux send-keys -t $SESSION:servers.right "echo 'Frontend server - Run: cd frontendv2 && pnpm run dev'" C-m

  # Window 2: dev (for general work)
  tmux new-window -t $SESSION:2 -n dev -c $PEQUITY_DIR
  tmux send-keys -t $SESSION:dev "cd $PEQUITY_DIR" C-m

  # Window 3: test (for running tests)
  tmux new-window -t $SESSION:3 -n test -c $PEQUITY_DIR
  tmux send-keys -t $SESSION:test "cd $PEQUITY_DIR" C-m
  tmux send-keys -t $SESSION:test "echo 'Backend tests: .venv/bin/pytest --reuse-db <path>'" C-m
  tmux send-keys -t $SESSION:test "echo 'Frontend tests: pnpm run test:unit-nowatch <path>'" C-m

  # Select the dev window by default
  tmux select-window -t $SESSION:dev
fi

# Attach to session
tmux attach-session -t $SESSION
