# Ticketastic

This CTF had a ticketing system where users could submit a ticket to the admin user, and the admin user would give a reply. It was split across two parts. The first site was a demo website that was used to show users what happened when they submitted a ticket, and what the admin can see. The second site was used as the actual site that the users would use.

### Flag 0

On the demo site, when logged in as the admin, the user is able to see all of the tickets. Upon selecting a ticket, it can be seen that the tickets are ordered by id in the url - *http://35.227.24.107/a89477cb16/ticket?id=2*
