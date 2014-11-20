#!/usr/bin/env bash
set -e

# create if not exist the directories to hold the iTerm and terminal colors
mkdir -p iTerm
mkdir -p Terminal

echo "\n ============================================
            Checking iTerm colors
 ============================================ \n"

# Copy all the .itermcolors into its specific folder
find $SOURCE_LOCATION -name '*.itermcolors'| while read file; do
	if [[ ! -f "$SOURCE_LOCATION/iTerm/$(basename "$file")" ]]; then
		echo "Linking theme file $(basename "$file")"
		ln -s "$file" "$SOURCE_LOCATION/iTerm"
	else
		echo "$(basename "$file") has been already linked!"
	fi
done

read -p "Enter a iTerm2 theme name to apply it (s/skip):";
echo "";
if [[ ! $REPLY =~ ^[sS]$ ]]; then
	open "$SOURCE_LOCATION/iTerm/$REPLY.itermcolors"
fi;

echo "\n ============================================
            Checking Terminal colors
 ============================================ \n"

# Copy all the .terminal colors into its specific folder
find $SOURCE_LOCATION -name '*.terminal'| while read file; do
	if [[ ! -f "$SOURCE_LOCATION/Terminal/$(basename "$file")" ]]; then
		echo "Linking theme file $(basename "$file")"
		ln -s "$file" "$SOURCE_LOCATION/Terminal"
	else
		echo "$(basename "$file") has been already linked!"
	fi
done

read -p "Enter a Termnail theme name to apply it (s/skip):";
echo "";
if [[ ! $REPLY =~ ^[sS]$ ]]; then
	open "$SOURCE_LOCATION/Terminal/$REPLY.terminal"
fi;

