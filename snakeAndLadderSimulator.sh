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
player=2

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
}

#function to check position
function getWinningPosition()
{
	while [[ $position -ne $WINNING_POSITION ]]
	do
		#calling all function here
		getPlayer
		getPlayerOptions
		getExactPosition

		#store position of player at count
		checkRollDie[count]=$position
		((count++))
	done
		echo "Winner Player Is : Player $player"
}

#function to check exact player position 100
function getExactPosition()
{
	if [[ $position -gt $WINNING_POSITION ]]
	then
		position=$((position - rolldie))
		elif [[ $position -lt $START_POSITION ]]
		then
			position=$START_POSITION
	fi
}


#function to check player 
function getPlayer()
{
	if [[ $player -eq 1 ]]
	then
		player=2
	else
		player=1
	fi
}

#calling winning function
getWinningPosition
