---
layout: default
title: ! 'Oracle performance issue when fetching BLOBs '
created: 1223307644
---
<p>Guys, I just came back from a customer who has a problem, they are keeping a large BLOB which contains serialized java classes per each subscriber in their system.</p><p>Usually Oracle fetches the BLOB fast enough for them to deliver within their performance goals, but once in a while (about 0.5% of the cases) the fetch takes longer times and causing them delays that are unacceptable.</p><p>I have two questions for you:</p><p>(1) is that right that Oracle is not a &quot;real-time&quot; system, therefore it will not guarantee response time? why does Oracle sometime takes more time than average to process a query, and can this be optimized by configuration??</p><p>(2) does it make sense to store the data not in the database (e.g. file-system, LDAP, SAN, gFS, ...) given that all we need is to be able to lock, read and write the data.</p><p>What do you think??</p>
