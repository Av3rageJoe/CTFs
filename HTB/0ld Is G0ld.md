# 0ld is G0ld

This writeup will contain a walkthrough of how I completed the 0ld is Gold box from Hack the box.

When this box is downloaded, a PDF file is given. However, upon attempting to open the file, it is found to be password protected. 

![](https://github.com/Av3rageJoe/CTFs/blob/master/HTB/Images/Screenshot%202020-02-15%20at%2013.06.34.png)

Obviously in order to gain access to the file, the password will now need to be found (cracked).

In order to do this, a password cracking tool called John the Ripper (JtR) can be used. In order for JtR to be able to crack a password, it needs a password hash. Luckily, JtR has a subset program called pdf2john.pl, which can extract extract password hashes from pdfs. In order to find this file, the command `locate pdf2john.pl` is run (I should mention at this point that I am using Kali Linux to complete this box). 

This returns that the path for the file as `/usr/share/john/pdf2john.pl`. Therefore, the full command is as follows: `/usr/share/john/pdf2john.pl '0ld is Gold.pdf' > pdf.hash`

Initially, the default settings were used to crack the password. However, this then resorted to brute forcing the password which would take an undetermined amount of time. Therefore, the mighty rockyou.txt wordlist was used to crack the password.

First of all, the wordlist was extracted from it's .gz format using `gzip -d /usr/share/wordlists/rockyou.txt.gz`. Once extracted, john was used with the rockyou.txt wordlist to crack the password as so: `john --wordlist=/usr/share/wordlists/rockyou.txt pdf.hash`. In not too long, the password was found to be ***jumanji69***

![](https://github.com/Av3rageJoe/CTFs/blob/master/HTB/Images/Screenshot%202020-02-15%20at%2013.20.56.png)

Once the file was unlocked, the following contents were revealed:

![]()

Now, if you look closely at the bottom of the photo, some text appears in very small writing. Upon enhancing on the text, it appears to look like morse code. 

A handy tool that was created by GCHQ to decode all sorts of data is CyberChef. Upon copying and pasting the morse code into cyberchef, the flag as revealed and found to be "*R1PSAMU3LMORS3*"
