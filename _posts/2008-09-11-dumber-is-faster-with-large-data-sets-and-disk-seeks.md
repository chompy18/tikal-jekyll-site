---
layout: default
title: Dumber is Faster with Large Data Sets (and Disk Seeks)
created: 1221120545
---
<p><a href="http://en.wikipedia.org/wiki/Jeremy_Zawodny">Jeremy_Zawodny</a> describes his experience of filtering database data in code instead of SQL and how it made it run 12 times faster than the SQL version. (Note that he was Yahoo's MySQL guru)</p><p>Using declerative forms (in this case SQL) is usually deemed better since it lets the container (the database) process it in a much better way (since people writing the database are supposedly much better at finding out how to do things optimally). In this case, the result is the opposite</p>
