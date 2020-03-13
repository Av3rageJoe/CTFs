# CTF/Pen test tools used.

## Recon

### Parameth.py

Parameth.py is a tool created by the user maK on GitHub. It is designed to brute force fuzz parameter names during GET and POST requests.

**Install:** `git clone https://github.com/maK-/parameth.git`

**Usage:** `./parameth.py -u URL`

**Source:** `https://github.com/maK-/parameth`

### wfuzz

wfuzz is a tool that can be used to fuzz anything in a URL. This could be path names, parameter names or paramater values.

**Install:** `pip3 install wfuzz`

**Usage:** `wfuzz -w [Wordlist] --hs [Error Message] http://google.com/username=FUZZ`

Where the FUZZ keyword is the area of the URL that is to be fuzzed. In addition to this, the --hs message can be replaces with --hc if an error code is to be provided instead.

**Source:** `https://github.com/xmendez/wfuzz`
