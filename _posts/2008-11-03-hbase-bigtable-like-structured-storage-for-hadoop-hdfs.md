---
layout: default
title: ! 'HBase: Bigtable-like structured storage for Hadoop HDFS'
created: 1225740677
---
<p>Just as Google's <a class="external" rel="nofollow" href="http://labs.google.com/papers/bigtable.html"><img height="11" width="11" src="http://wiki.apache.org/wiki/modern/img/moin-www.png" alt="[WWW]" /> Bigtable</a> leverages the distributed data storage provided by the <a class="external" rel="nofollow" href="http://labs.google.com/papers/gfs.html"><img height="11" width="11" src="http://wiki.apache.org/wiki/modern/img/moin-www.png" alt="[WWW]" /> Google File System</a>, HBase provides Bigtable-like capabilities on top of Hadoop Core. Data is organized into tables, rows and columns. An Iterator-like interface is available for scanning through a row range (and of course there is the ability to retrieve a column value for a specific key). Any particular column may have multiple versions for the same row key.</p>
