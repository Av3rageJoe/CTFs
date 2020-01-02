# Petshop Pro

This CTF uses a website that is designed for buying pets.

### Flag 0

The first flag was found by tampering the data sent to the server. An attempt to buy a kitten was made, and when the checkout button was pressed, the request was intercepted using Burp Suite. The capture can be seen below.

!['The intercepted packet for the checkout request'](https://github.com/Av3rageJoe/CTFs/blob/master/HackerOneCTFs/Images/Screenshot%202020-01-02%20at%2022.42.33.png)

It was noticed in this request, a parameter called *'cart'*  was sent with some URL encoded input. This input was decrypted using CyberChef, and the output can result can be seen below.

!['Decoded cart parameter'](https://github.com/Av3rageJoe/CTFs/blob/master/HackerOneCTFs/Images/Screenshot%202020-01-02%20at%2022.46.07.png)

From this output, it can be seen that the price of the product is sent from the client side.

With the intercepted packet, the price field is then modified to 0 (So that we can get a kitten for free!). As a result, the flag was obtained.

### Flag 1
