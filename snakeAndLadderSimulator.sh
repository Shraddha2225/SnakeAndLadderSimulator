#!/bin/bash -x
#welcome message
echo "WELCOME SNAKE AND LADDER SIMULATOR"

#declare position
position=0

function rollDie()
{
	rolldie=$((RANDOM % 6 + 1))
	echo $rolldie
}

rollDie
