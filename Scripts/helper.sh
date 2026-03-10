#!/bin/zsh
set -euo pipefail

get_platform() {
	if [[ -n "$(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip')" ]]; then
		printf "Windows"

	elif [[ "$(uname -s)" == "Darwin" ]]; then
		printf "MacOS"

	elif [[ -f /etc/os-release ]]; then
		. /etc/os-release
		case "$ID" in
			arch) printf "Arch" ;;
			*) printf "Unknown" ;;
		esac

	else
		printf "Unknown"
	fi
}

require_file() {
	local file="$1"
	if [[ ! -f "$file" ]]; then
		printf '%s not found !\n' "$file" >&2
		exit 1
	fi
}


build_array_from_file() {
	local file="$1"
	while IFS= read -r line; do
		[[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
		printf '%s\n' "$line"
	done < "$file"
}


clone_or_pull() {
	local repo="$1"
	local dir="$2"
	if [[ -d "$dir/.git" ]]; then
		git -C "$dir" pull
	else
		git clone "$repo" "$dir"
	fi
}


press_any_key() {
	printf "Press any key to continue..."
	read -k 1
	printf "\n"
}
