#!/bin/bash -x
#welcome message
echo "WELCOME SNAKE AND LADDER SIMULATOR"

#constants
NO_PLAY=0
LADDER=1
SNAKE=2

#declare position
position=0

function rollDie()
{
	rolldie=$((RANDOM % 6 + 1))
	echo $rolldie
}

rollDie

#function to check player options 
function getPlayerOptions()
{
	CheckPlayerNextMove=$((RANDOM%3))
	case $CheckPlayerNextMove in
			$NO_PLAY)
						playerposition=$position
						;;
			$LADDER)
						playerposition=$((position + rolldie))
						;;
			$SNAKE)
						playerposition=$((position - rolldie))
	esac
	echo $playerposition
}
#calling fuction
getPlayerOptions

