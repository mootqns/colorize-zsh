#!/bin/zsh

line_to_add="hello zshrc"

# check if the line is already present in the .zshrc file
if grep -qxF "$line_to_add" ~/.zshrc; then
  echo "the line is already present in .zshrc."
else
  # append the line to the .zshrc file if it's not already there
  echo "$line_to_add" >> ~/.zshrc
  echo "line added to .zshrc: $line_to_add"
  
  . ~/.zshrc
  
  echo ".zshrc has been re-sourced."
fi
