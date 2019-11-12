# Glory of the Garden

**Topic:** Digital Forensics

**Clue:** This garden contains more than it seems.

This challenge involves downloading a file. This file is a jpg file called garden.jpg. Upon opening the image a garden appears and nothing seems suspicous.
One of the first things to do when looking at an image file is to run the **strings** command. This command will search the ascii contained withn a file and print all of the printable characters.

Using the command **strings garden.jpg** returns a lot of random characters, and then at the bottom a message saying '*Here is a flag "picoCTF{more_than_m33ts_the_3y3b7FBD20b}*"'

**Answer:** picoCTF{more_than_m33ts_the_3y3b7FBD20b}
