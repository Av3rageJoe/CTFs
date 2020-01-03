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

After viewing all of the website, it was found that there was not a large attack surface. Therefore, further directories were searched for by performing a dictionary attack. A small bash script was created that makes use of a directories wordlist to discover any hidden pages.

```bash
while read i;
do
	if ! curl -s -I http://34.74.105.127/6661caf4ed/$i | grep -q "404"; then
		echo http://34.94.3.143/d7852a1133/page/$i;
		echo "http://34.74.105.127/6661caf4ed/$i"
	fi;
	
done </Path/to/Directory/Wordlist
```

This script returned that a webpage called /login was found. When navigated too, it was found that this contained a login for the admin user. Some default admin passwords were tested (admin:admin, admin:password etc) however these did not provide any results. It was noticed during these attempts that the webpage was displaying saying that the username was invalid. This led to the thought process that username enumeration was possible. Another bash script was created that would test common usernames, and return the correct username when found.

To try and find the username, the program hydra was used. In order to use hydra, the parameters that the program passes need to be captured, along with the error message that the web page displays. To find the parameters, Owasp-Zap was used to capture a request.

!['Owasp-Zap /login request'](https://github.com/Av3rageJoe/CTFs/blob/master/HackerOneCTFs/Images/Screenshot%202020-01-03%20at%2012.58.11.png)

Once the parameters were found, the hydra script was ready to be created. The full script is shown below

!['hydra command'](https://github.com/Av3rageJoe/CTFs/blob/master/HackerOneCTFs/Images/Screenshot%202020-01-03%20at%2019.22.57.png)

An explanation of the syntax for the above command can be found below.

  `-L   :    The username list to test`
  
  `-p   :    The password to use in the requests`
  
  `34.74.105.127   :   The root domain name`
  
  `http-post-form  :   Specifies to use the HTTP POST method`
  
  `"/39580748ad/login:username=^USER^&password=^PASS^:Invalid username"  :   "/Path/to/login/page:<parameters to submit in the post request: The error message displayed"`
  
  `^USER^   :   Where the command should place the usernames in the username list`
  
  `^PASS^   :   Where the command should place the password`
  
  `-I   :   Begin from where left off, if the command was recently stopped`
  
  `-t   :   The number of threads to use`

Once this command had finished running, it was found that the username was *carmelina*.

!['hydra finding the username'](https://github.com/Av3rageJoe/CTFs/blob/master/HackerOneCTFs/Images/Screenshot%202020-01-03%20at%2019.38.22.png)

Once the username was found, the password needed to be found. To do this, a very similar command was used as previously except for the fact that the username was set to carmelina, and the password made use of a password list. This request can be seen below. 

!['hydra command to find the password'](https://github.com/Av3rageJoe/CTFs/blob/master/HackerOneCTFs/Images/Screenshot%202020-01-03%20at%2020.03.39.png)

Hydra then successfully found the password to be *diane*.

!['hydra finding the password'](https://github.com/Av3rageJoe/CTFs/blob/master/HackerOneCTFs/Images/Screenshot%202020-01-03%20at%2020.05.10.png)

Once logged in, the flag displayed itself.

### Flag 2

Once logged in, it is possible to edit the items for sale. This presents a possibility for XSS if the input is not correctly sanitised. Therefore, systematically in each field the syntax `<img src='x' onerror=alert(1)>` was entered. This found that  if the script was injected into the name field then the alert would fire once the checkout page was navigated to, and reveal the flag.
