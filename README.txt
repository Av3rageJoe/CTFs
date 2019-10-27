This challenge involved brute forcing the passcode for an iPhone.

In order to complete the challenge, the POST request used to submit the passcode needed to be captured, in order to find out the variable name that the passcode was saved as.
This was done by capturing the header file using burp. It was then found that the variable name used was called "passcode"

A curl request could then be formed, sending a POST request to the website and passing in an argument for the passcode variable.
However, this method would be tiresome as it would still involve manually changing the passcode each time.

Therefore, a bash script was created that, using the laws of probability, would run from 1000 to 9999, trying to guess the passcode.
If the curl request returned the phrase 'Try Again', then the passcode would be incorrect. However, if another response was sent, then the passcode would be found to be true.

The output of the curl request was saved to a text file called temp.txt. The grep command was then used on this text file to see if it contained the phrase  'Try again'.
If it was found that 'Try again' was not contained within temp.txt, then the passcode used would be found to be correct and the code would be outputted to the screen and the program stopped. 


