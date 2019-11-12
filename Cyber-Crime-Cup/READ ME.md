## Pin II challenge

In this CTF challenge, a firwalls pin needed to be guessed. The only information known was that the pin was 2 digits in length. 
Every time five wrong attempts were entered, the firewall would block your IP for a varying amount of time depending on the level. There were ten levels in total.

In order to crack the pin on each level, a bash script was created.

The bash script used a for loop that would run from 0 to 99, and every time the modulus of the iteration equaled 0, it would pause for a set amount of time.
this amount of time had to be manually adjusted each level, and the reason for the pause would be to wait for the firewall to reset to allow another five attempts.

Using curl requests, a request was submitted passing in the current guess each time. If the output of the curl contained the flag then the pin guessed was correct and the program would stop

The program would continue running until the pin had been found.

**Required Information**

  1. The timeout of the firewall
  2. The users PHPSESSID
