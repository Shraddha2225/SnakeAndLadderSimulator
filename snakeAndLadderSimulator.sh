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
}

#function to check player options 
function getPlayerOptions()
{
	while [[ $position -lt $WINNING_POSITION ]]
	do
		rollDie
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
			if [[ $position -gt $WINNING_POSITION ]]
			then
				position=$((position - rolldie))
				elif [[ $position -lt 0 ]]
				then
					position=$START_POSITION
			fi
	done
}
#calling fuction
getPlayerOptions

