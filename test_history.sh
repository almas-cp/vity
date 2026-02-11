#!/bin/bash
# Test script to verify history injection works

echo "Testing history injection..."
echo ""

# Test 1: Check if print -s works in zsh
if [ -n "$ZSH_VERSION" ]; then
    echo "✓ Running in ZSH"
    echo "Testing print -s command..."
    print -s "echo 'test command from script'"
    echo "Press UP ARROW now - you should see: echo 'test command from script'"
    echo ""
else
    echo "✗ Not running in ZSH (you're in: $SHELL)"
    echo "This test is designed for ZSH"
    exit 1
fi

# Test 2: Check history options
echo "Current ZSH history options:"
setopt | grep -i hist

echo ""
echo "History file location: $HISTFILE"
echo "History file exists: $([ -f "$HISTFILE" ] && echo 'YES' || echo 'NO')"

if [ -f "$HISTFILE" ]; then
    echo "Last 3 history entries:"
    tail -3 "$HISTFILE"
fi
