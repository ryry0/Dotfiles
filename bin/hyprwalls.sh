#!/bin/env zsh

hyprctl hyprpaper unload all
# Sets a random wallpaper with hyprpaper

WALLPAPERS=($(ls -d $HOME/hyprwalls/*))

WALL=${WALLPAPERS[ $RANDOM % ${#WALLPAPERS[@]} ]}

hyprctl hyprpaper preload $WALL
hyprctl hyprpaper wallpaper ,$WALL
