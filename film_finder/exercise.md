# Activity:
1. Add a list of actors (semi-colon delimited) to each film
(Remember class activities with joins) -- 
hint: group_concat
GROUP_CONCAT(concat(first_name, " ", last_name) ORDER BY last_name ASC SEPARATOR ";")
hint 2: everything depends on the film.id (you should group by it)

2. Allow searching by things other than the film description (You may try "or" or "union" -- this is easily solved at the SQL level)

3. Research: why is it dangerous to allow string interpolation in these queries?

4. Make it so that all films are loaded at startup (rather than waiting for a button click).  Hint: Consider your constructor.

5. Research: Is there a nicer way to use the reader than `reader[0]` etc?  (Can you get the field names to help you?)