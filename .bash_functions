# here are functions defined by naran:

#! /usr/bin/bash

function note(){
	
	args=("$@")
	length=$#

	for (( i=0; i<$length; i++ ))
	do
		echo " ${args[$i]} have been appended to the note list " 
		(echo " ${args[$i]}" >> ~/notes_dir/notes.txt) 
	done

	}

function mkd(){
	dir=$1
	mkdir $dir && cd $dir
	}

function r(){
	#xdotool key ctrl+u
	#xdotool key comma
	tmux rename-window $1
	}


