#!/usr/bin/env bash

file="$1"
if [[ ! -r "$file" ]] || [[ ! -x "$file" ]]; then
  echo "Provided file does not exist, cannot be read or executed. Exiting"
  exit 1
fi

find_cat_like_bin() {
  bat_bin=$(which "$1" 2>/dev/null)
  code="$?"
  if ((code != 0)); then
    return 1
  fi
  echo "$bat_bin"
}

declare -a cat_like_bins
cat_like_bins=(
  "$(find_cat_like_bin "cat")"
  "$(find_cat_like_bin "batcat")"
  "$(find_cat_like_bin "bat")"
)

# Need to check to see if any of the values in cat_like_bins are "empty".
# It turns out that if the find_cat_like_bin doesn't return anything, an
# empty "" is still inserrted into the array.
cat_bin=""
for bin in "${cat_like_bins[@]}"; do
  if [[ -n "$bin" ]]; then
    cat_bin="$bin"
  fi
done

if [[ ! -x "$cat_bin" ]]; then
  echo "Could not find suitable cat like program. What kind of system are you running?"
  exit 1
fi

echo
"$cat_bin" "$file"
shift "$((OPTIND))"
source "$file" "$@"
echo
