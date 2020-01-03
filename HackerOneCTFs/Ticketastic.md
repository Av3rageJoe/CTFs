# Ticketastic

This CTF had a ticketing system where users could submit a ticket to the admin user, and the admin user would give a reply. It was split across two parts. The first site was a demo website that was used to show users what happened when they submitted a ticket, and what the admin can see. The second site was used as the actual site that the users would use.

### Flag 0

On the demo site, when logged in as the admin, the user is able to see all of the tickets. Upon selecting a ticket, it can be seen that the tickets are ordered by id in the url - `http://35.227.24.107/a89477cb16/ticket?id=2`

By changing the id parameter to an id that is out of bound, an error is thrown by the server. This led to the theory that a SQL database might be used. To test this, the id parameter was modified to say *2'*. The system then threw the following error:

!['The SQL error thrown'](https://github.com/Av3rageJoe/CTFs/blob/master/HackerOneCTFs/Images/Screenshot%202020-01-03%20at%2020.49.04.png)

This proved that a SQL database was in use, and because the apostrophe was not handled correctly, SQL injection was likely to be possible. To further test the SQLi, a tool called SQLMap was used. To use SQLMap, the GET request to view a ticket was captured and saved to a file using Burp Suite.

!['The burp request captured'](https://github.com/Av3rageJoe/CTFs/blob/master/HackerOneCTFs/Images/Screenshot%202020-01-03%20at%2021.00.16.png)

The command `sqlmap -r <filename> --dump all` was then run, to see if the database' contents could be dumped. This database was successfully dumped and revealed two datables, one with the tickets and their contents in it, and another with usernames/passwords. However, no flag was found.

The site that was intended to be used by actual users was then navigated to and the same steps tried to be recreated. However, the admin password was not found to be the same as before. SQLi was also attempted, but did not seem possible either. The URL for the tickets page that was found earlier was then navigated to, to see if user authentication was correctly implemented. This page loaded successfully, and allowed for the non-authenticated user to perform SQLi on the page. The exact same steps were followed to do this as before, however this time only the tables were dumped. This was done using the command `sqlmap -r <filename> --tables`

This returned several databases. However, the most notable one for this purpose was one called "level7".

!['SQLMap showing the level7 database](https://github.com/Av3rageJoe/CTFs/blob/master/HackerOneCTFs/Images/Screenshot%202020-01-03%20at%2021.15.10.png)

This databse clearly shows two tables - tickets and users. The next step was to dump this databse using the following command `sqlmap -r <filename> -D level7
