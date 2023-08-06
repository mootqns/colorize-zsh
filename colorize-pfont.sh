#!/bin/zsh

generate_prompt() {
  local color_code="$1"
  local PROMPT="PROMPT=\"%F{$color_code}%n %1~ %# %f\""
  echo "$PROMPT"
}

update_prompt() {
  local color_code="$1"
  local new_prompt=$(generate_prompt "$color_code")

  # check if any line starting with PROMPT exists in the .zshrc file
  if grep -qE '^PROMPT=' ~/.zshrc; then
    # if found, remove those lines
    sed -i '' '/^PROMPT=/d' ~/.zshrc
  fi

  echo "$new_prompt" >> ~/.zshrc
}

# check the number of arguments passed to the script
if [ $# -eq 1 ]; then
  # if the argument is a valid color name, use the corresponding color code
  case "$1" in
    purple)
      update_prompt "135"
      ;;
    green)
      update_prompt "85"
      ;;
    *)
      # check if the argument is a numeric value for the color code
      if [[ "$1" =~ ^[0-9]+$ ]]; then
        update_prompt "$1"
      else
        echo "Invalid color. Please use 'purple', 'green', or provide a numeric value for the color code."
      fi
      ;;
  esac
else
  echo "Usage: $0 [color | color_code]"
fi

exec zsh
