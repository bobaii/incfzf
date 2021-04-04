#!/bin/bash

path=$(echo -e "/\n`echo $HOME`" |fzf)
selection=''

while [[ ! $1 == '**flag**' ]]; do

[[ -n $selection ]] && 	path="$path/$selection"

	
	if [[ $(find $path -maxdepth 1 -type d |
		wc -l   ) == 1 ]]; then break; fi

	selection=$(ls  $path | fzf --bind "ctrl-s:execute(echo '**flag**')")

	set -- $selection
	
done

echo $path
