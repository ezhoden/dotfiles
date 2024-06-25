#!/usr/bin/env bash

dotfiles="$HOME/dotfiles"

configs=(
	hypr
	kitty
	mako
	nvim
	waybar
)

echo "Creating symlink for dotfiles"
for value in "${configs[@]}"
do
	destination="$HOME/.config/$value"
	if [ -d "$destination" ]; then echo "Directory $destination already exists, deleting it"; fi
	if [ -d "$destination" ]; then rm -rf $destination; fi
	ln -s $dotfiles/$value $HOME/.config/
	echo "Symlink for $value has been created ('$dotfiles/$value' -> $destination)"
done

