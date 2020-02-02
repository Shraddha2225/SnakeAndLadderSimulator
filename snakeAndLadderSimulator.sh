#!/bin/bash -x
#welcome message
echo "WELCOME SNAKE AND LADDER SIMULATOR"

#constants
NO_PLAY=0
LADDER=1
SNAKE=2
START_POSITION=0
WINNING_POSITION=100

#declare position
position=0

function rollDie()
{
	rolldie=$((RANDOM % 6 + 1))
	echo $rolldie
}

#function to check player options 
function getPlayerOptions()
{
	while [[ $position -lt $WINNING_POSITION ]]
	do
		CheckPlayerNextMove=$((RANDOM%3))
		case $CheckPlayerNextMove in
			$NO_PLAY)
						position=$position
						;;
			$LADDER)
						position=$((position + rolldie))
						;;
			$SNAKE)
						position=$((position - rolldie))
		esac
			if [[ $position -lt 0 ]]
				then
					position=$START_POSITION
				fi
				echo "player current position :$position"
	done
}
#calling fuction
rollDie
getPlayerOptions

