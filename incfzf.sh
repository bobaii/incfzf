#!/bin/bash

path=$(echo -e "/\n`echo $HOME`" |fzf)
selection=''

while [[ ! $1 == '**breakflag**' ]]; do

[[ -n $selection ]] && 	path="$path/$selection"

# use ctrl-s to break when at desired dir
	
	if [[ $(find $path -maxdepth 1 -type d |
		wc -l   ) == 1 ]]; then break; fi

	selection=$(ls  $path | fzf --bind "ctrl-s:execute(echo '**breakflag**')")

	set -- $selection
	
done

echo $path


