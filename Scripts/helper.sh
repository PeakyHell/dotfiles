#!/bin/bash

clone_or_pull() {
	local repo="$1"
	local dir="$2"
	if [[ -d "$dir/.git" ]]; then
		git -C "$dir" pull
	else
		git clone "$repo" "$dir"
	fi
}
