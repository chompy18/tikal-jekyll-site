---
layout: default
title: ! 'Autofetch: specifies association fetches automatically'
created: 1208099820
---
<p><span class="thmr_call" id="thmr_42"><span class="thmr_call" id="thmr_6"><p>Autofetch is an extension to Hibernate that automatically specifies fetch/prefetch joins for programs. The idea is that a program using Autofetch specifies all associations as lazy and includes no fetches in queries, while Autofetch transparently modifies loads/gets/queries to include the right fetch/prefetch directives.</p> <p>How does it work? Autofetch instruments your entities to monitor your program's traversal patterns off of query results. The first time a query is executed all associations are loaded lazily. Thereafter, Autofetch &quot;learns&quot; the right prefetch directives. Autofetch distinguishes between queries in different call stack contexts so it can provide different prefetch directives for a single query depending on the caller.</p></span></span></p>
