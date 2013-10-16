---
layout: default
title: A common problem when optimizing COUNT()
created: 1221986730
---
<p>When optimizing queries for customers, the first thing I do with a slow query is figure out what it's trying to do. You can't fully optimize a query unless you know how to consider alternative ways to write it, and you can't do that unless you know what the query &quot;means.&quot; I frequently run into a situation where I'm forced to stop and ask the developers what they were trying to do with COUNT(). This is database-agnostic, not related to MySQL.</p>
