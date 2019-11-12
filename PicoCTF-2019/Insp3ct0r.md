# Insp3ct0r

**Topic:** Web Exploitation

**Clue:** Kishor Balan tipped us off that the following code may need inspection: https://2019shell1.picoctf.com/problem/28717/

The website is a vey basic website that utilises HTML, CSS and JavaScript. Upon looking at the HTML, the following snippet fo flag can be seen:

![Part one of the flag](https://github.com/Av3rageJoe/CTFs/blob/master/PicoCTF-2019/Images/Screenshot%202019-11-12%20at%2018.23.51.png)

This implies that the remainder of the flag is located in other areas of the source code. Upon looking at the JavaScript file, the third part of the flag can be seen:

![The second part of the flag](https://github.com/Av3rageJoe/CTFs/blob/master/PicoCTF-2019/Images/Screenshot%202019-11-12%20at%2018.27.41.png)

The second part is then found in the CSS files:

![The third part of the flag](https://github.com/Av3rageJoe/CTFs/blob/master/PicoCTF-2019/Images/Screenshot%202019-11-12%20at%2018.32.44.png)

Therefore by putting the flag together it can be found as picoCTF{tru3_d3t3ct1ve_0r_ju5t_lucky?2717d7be}

**Answer:** picoCTF{tru3_d3t3ct1ve_0r_ju5t_lucky?2717d7be}
