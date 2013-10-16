---
layout: default
title: LazyInitializationException when accessing a collection or association when
  parent is fetched using the query cache
created: 1214855340
---
<p><span class="thmr_call" id="thmr_42"><span class="thmr_call" id="thmr_6"><p>Hibernate INCORRECTLY (see <a title="http://opensource.atlassian.com/projects/hibernate/browse/HHH-1523" href="http://opensource.atlassian.com/projects/hibernate/browse/HHH-1523">http://opensource.atlassian.com/projects/hibernate/browse/HHH-1523</a>) throws LazyInitializationException on fetch join on a lazy collection or lazy proxy accessed outside the session scope.</p></span></span></p>
