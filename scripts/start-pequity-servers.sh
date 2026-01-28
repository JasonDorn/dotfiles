#!/bin/bash
# Launch dedicated Kitty window for running Pequity servers
# This window stays open and doesn't respond to the global hotkey

kitty \
  --instance-group=servers \
  --title="Pequity Servers" \
  --directory=~/Developer/pequity \
  bash -c "
    echo '=== Pequity Server Window ==='
    echo 'This window is for running servers only.'
    echo 'Use Cmd+\` to open your regular dev terminal.'
    echo ''
    exec zsh
  "
