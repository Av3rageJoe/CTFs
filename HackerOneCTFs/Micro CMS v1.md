# Micro CMS v1

This CTF contained four flags for the user to find. 

### Flag 0

Initially, as with any CTF, the structure of the website was examined. Once this was done, a new page was created. From examining the URL, it could be seen that page had been given the ID "6". Another new page was then created and it was given the ID 7. This led to the conclusion that the pages were given ID's sequentially.

For testing purposes, the url "http://34.94.3.143/6874967a31/page/8" was then navigated to, to see if it existed. However, a 404 response was received.

In order to test what URLs existed, a quick bash script was created. The script makes a curl request for all pages from 0 to 100. If the response is not a 404 code, then the URL is appended to a text file containing valid URLs. The script is shown below.

```bash
for i in {0..100}
do
	if ! curl -s -I http://34.94.3.143/d7852a1133/page/$i | grep -q "404"; then
		echo http://34.94.3.143/d7852a1133/page/$i >> URLs.txt;
	fi;
done
```

The output of this command showed that the pages 1,2,4,6 and 7 were valid pages. 

!['Output of Bash script'](https://github.com/Av3rageJoe/CTFs/blob/master/HackerOneCTFs/Images/Screenshot%202020-01-02%20at%2019.09.40.png)

The pages 1, 2, 6 and 7 can all be navigated to manually. However, when page 4 is navigated to, the website throws a 403 error.

During the enumeration stage of the website, it was noticed that the page numbers are passed in the URL during two stages - viewing the page and editing the page.

Therefore, the edit link for a valid page was obtained, and the page number was changed to page 4. This then showed the flag.

### Flag 1

To find the second flag, it involved tampering input to try and produce an unexpected output. By modifying the page domain in the URL of the edit pages section of the website, the flag can be seen.

An apostrophe was appended at the end to create the URL "http://34.94.3.143/d7852a1133/page/edit/6'". 

### Flag 2

The third flag was found by injecting some XSS into the web page. By observing the pages created, it could be seen that the title is stored on two pages: The main page and each individual directory. By adding the code `<img src = x onerror=alert(1)>` to the title section when creating a new page, the script is fired when the homepage is navigated to. However, this alert gives the flag, rather than the alert message. 

### Flag 3

Knowing that the third flag involved using XSS, another form of XSS was used for this flag. In one of the input fields when creating a page, the text `" onload=alert(1)>` was entered, and the flag appeared. 
