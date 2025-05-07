# Custom cd function
# TODO: Not working :(
# z() {
#   # Check if the first argument is a string of periods
#   if [[ "$1" =~ ^\.+$ ]]; then
#     # Count the number of periods and move n - 1 directories back
#     local n=${#1}
#     echo "$n"
#     command cd "..$(printf '/..%.0s' $(seq 1 $((n-1))))"
#   else
#     command zoxid "$@"
#   fi
# }

# run a different fastfetch config based on OS
fetch() {
  if [[ $# -eq 0 ]]; then
    if [[ "$(uname)" == "Linux" ]]; then
      fastfetch --config ~/dotfiles/.config/fastfetch/linux-config.jsonc
    elif [[ "$(uname)" == "Darwin" ]]; then
      fastfetch --config ~/dotfiles/.config/fastfetch/macos-config.jsonc
    else
      echo "Unsupported OS..."
      fastfetch
    fi
  else
    fastfetch "$@"
  fi
}

# run `convert-pngs.sh` before adding files to git IF in a `obsidian` repo
git() {
  local cmd="$1"; shift

  if [[ "$cmd" == "add" ]]; then
    local root
    root=$(command git rev-parse --show-toplevel 2>/dev/null) || root=""

    if [[ "$root" == */obsidian ]] && ! "$root/scripts/convert-pngs.sh"; then
        echo -e "Failed to convert PNGs. Aborting \`git add\`." >&2
        return 1
    fi
  fi
  command git "$cmd" "$@"
}
