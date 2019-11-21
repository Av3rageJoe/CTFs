# Lets Warm Up

**Topic:** General Skills

**Clue:** If I told you a word started with 0x70 in hexadecimal, what would it start with in ASCII?

This is a simple challenge of retrieving an ASCII lookup table, and matching the hexadeimal 0x70 to its ASCII value. Looking at the ASCII table below, it is seen that the hexadecimal 70 relates to the character "p"

![A ASCII lookup table](https://github.com/Av3rageJoe/CTFs/blob/master/PicoCTF-2019/Images/Screenshot%202019-11-21%20at%2015.49.25.png)

Therefore, the flag is **picoCTF{p}**

Another way to do this challenge is through the command line. The xxd command is capable of performing a hexdump of any file passed to it. In addition to this, it can perform the reverse and convert hex into ASCII. The command **echo 70 | xxd -r -p;** will take the hexadecimal 70, and display its ASCII value. The -r tells it to convert the hex to ASCII (rather than the other way around, which is its default), and the -p option tells the system to use a plain format. The result of this command can be seen below.

![A command line way of converting hexadecimal](https://github.com/Av3rageJoe/CTFs/blob/master/PicoCTF-2019/Images/Screenshot%202019-11-21%20at%2015.57.41.png)

**Answer:** picoCTF{p}
