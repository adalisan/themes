#!/usr/bin/env bash
set -e

# create if not exist the directories to hold the iTerm and terminal colors
mkdir -p "$SOURCE_LOCATION/Themes/iTerm"
mkdir -p "$SOURCE_LOCATION/Themes/Terminal"

echo "\n ============================================
            Checking iTerm colors
 ============================================ \n"

# Copy all the .itermcolors into its specific folder
find "$SOURCE_LOCATION/Themes" -name '*.itermcolors'| while read file; do
	if [[ ! -f "$SOURCE_LOCATION/Themes/iTerm/$(basename "$file")" ]]; then
		echo "Linking theme file $(basename "$file")"
		ln -s "$file" "$SOURCE_LOCATION/Themes/iTerm"
	else
		echo "$(basename "$file") has been already linked!"
	fi
done

echo ""
read -p "Enter a iTerm2 theme name to apply it (s/skip):";
echo "";
if [[ ! $REPLY =~ ^[sS]$ ]]; then
	open "$SOURCE_LOCATION/Themes/iTerm/$REPLY.itermcolors"
fi;

echo "\n ============================================
            Checking Terminal colors
 ============================================ \n"

# Copy all the .terminal colors into its specific folder
find "$SOURCE_LOCATION/Themes" -name '*.terminal'| while read file; do
	if [[ ! -f "$SOURCE_LOCATION/Themes/Terminal/$(basename "$file")" ]]; then
		echo "Linking theme file $(basename "$file")"
		ln -s "$file" "$SOURCE_LOCATION/Themes/Terminal"
	else
		echo "$(basename "$file") has been already linked!"
	fi
done

echo ""
read -p "Enter a Termnail theme name to apply it (s/skip):";
echo "";
if [[ ! $REPLY =~ ^[sS]$ ]]; then
	open "$SOURCE_LOCATION/Themes/Terminal/$REPLY.terminal"
fi;

