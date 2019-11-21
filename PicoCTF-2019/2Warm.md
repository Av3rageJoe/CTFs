# 2warm 

**Topic:** General skills

**Clue:** Can you convert the number 42 (base 10) to binary (base 2)?

This is a simple challenge that requires the use of 2's complement. Binary is compromised of 1's and 0's. In binary, each "place" represents a number to the power of two.

Binary has it's LSB on the left. Therefore binary would look like as follows for numbers that are to the power of two

For example:

  2<sup>0</sup> = 0 = 0b
  2<sup>1</sup> = 2 = 10b
  2<sup>2</sup> = 4 = 100b
  2<sup>3</sup> = 8 = 1000b
  2<sup>4</sup> = 16 = 10000b
  ...

To create the number 6, you would subtract the largest wholes two complement number that is less that or equal to 6. In this case it would be 4, or 100b.
This would leave with the remainder 2. In binary, two is 10b. 
If you were to combine the two then you would have
100b 
+
010b
=
110b. 

The same can be applied for 42. The largest number to the factor of two that fits inside 42 is 36. 36 in binary is 100000b.
42 - 32 = 10. The largest 2's complement number that fits in 10 is 8. 8 in binary is 1000b.
10 - 8 = 2. In binary 2 is 10b. 
Therefore:

100000b
+
001000b
+
000010b
=
101010b

**Answer:** picoCTF{101010}
