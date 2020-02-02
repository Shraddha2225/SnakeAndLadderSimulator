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
count=0

#function rolldie
function rollDie()
{
	rolldie=$((RANDOM % 6 + 1))
}

#declare a dictionary
declare -A checkRollDie

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
			checkRollDie[count]=$position
			((count++))
	done
}
#calling fuction
getPlayerOptions

