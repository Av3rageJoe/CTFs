# Emdee five for life

This CTf involved creating a script that would grab a random string given by a webpage, convert it into an MD5 hash and then submit the hash to a text box. However, if this was done at a normal human rate then a "Too slow!" message would appear. Therefore you need to create a script to do it within the limited time provided. 

!['The error message displayed'](https://github.com/Av3rageJoe/CTFs/blob/master/HTB/Images/Screenshot%202020-03-13%20at%2014.58.43.png)

There are two ways that spring to mind to do this - Python requests and Python selenium. I opted to use Python Selenium. 

In order for this script to work, I needed to tell the program where the string to be hashed is located, where to then input the hashed string and what button to press to submit the string.

The completed script can be found below for how I completed this challenge.

```import requests
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

# Set the browser to use as Firefox
fireFoxOptions = webdriver.FirefoxOptions()
driver  = webdriver.Firefox(firefox_options=fireFoxOptions)

# Give the driver the URL of the website and navigate to it
url= "http://docker.hackthebox.eu:32628/"
driver.get(url)

# Grab the string to be hashed
content = driver.find_element_by_xpath('/html/body/h3').text

# Hash the string
import hashlib
hash_object = hashlib.md5(content.encode())
md5_hash = hash_object.hexdigest()

# Enter the MD5 hash into the box
messageBox = driver.find_element_by_xpath('/html/body/center/form/input[1]')
messageBox.send_keys(md5_hash)


# Press the button to submit the hash
xpath = '/html/body/center/form/input[2]'
btn = driver.find_element_by_xpath(xpath)
btn.click()
```
