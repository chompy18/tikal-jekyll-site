---
layout: default
title: ! ' Caching, Parallelism and Scalability'
created: 1221809347
---
<p>What about libraries and subsystems outside of your control?</p><p>Specifically databases that touch disks that inherently involve sequential, serial processing? And there is no way you can change your database vendor&rsquo;s code. Systems that involve all but the simplest, most infrequent database use would be facing a massive bottleneck thanks to this serialization. Databases are just one common example of process serialization, but there could be others as well. Serialization is the real enemy here, as it undoes any of the throughput gains parallelism has to offer.</p>
