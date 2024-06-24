#!/usr/bin/env sh

# Specify the directory you want to search in
directory="/home/ezhoden/dotfiles/wallpapers"

# Check if the directory exists
if [ -d "$directory" ]; then
    # Get a list of files in the directory
    files=("$directory"/*)
    
    # Get the number of files in the directory
    num_files=${#files[@]}
    
    if [ "$num_files" -gt 0 ]; then
        # Generate a random index within the range of number of files
        rand_index=$(( RANDOM % num_files ))
        
        # Get the path of the random file
        random_file="${files[$rand_index]}"
        
        swww-daemon & swww img $random_file --transition-fps 240 --transition-duration 1.5 --transition-type wave --transition-wave 69,42 --transition-angle 0
        dunstify "Wallpaper updated"
    else
        hyprctl notify -1 1000 "rgb(ff1ea3)" "Directory is empty"
    fi
else
    hyprctl notify -1 1000 "rgb(ff1ea3)" "Directory not found"
fi
