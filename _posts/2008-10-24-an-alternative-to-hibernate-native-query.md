---
layout: default
title: An alternative to Hibernate native Query
created: 1224836826
---
<p>Hi,</p>
<p>In one of the projects I am working on I have the following scenario:</p>
<p>A Domain entity with many to many relationship to a&nbsp; SyslogServer entity:</p>
<pre>
//domain</pre>
<pre>
@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE})
@JoinTable(name = &quot;NEO_DOM_SYSLG_MAP&quot;,
 joinColumns = {@JoinColumn(name = &quot;DOMAIN_ID&quot;, unique = false)},
 inverseJoinColumns = {@JoinColumn(name = &quot;SYSLOG_ID&quot;, unique = false)})
 public Set&lt;SyslogServer&gt; getSyslogServers() {
 return _syslogServers;
 }
 

//syslog

@ManyToMany(mappedBy = &quot;syslogServers&quot;)
 public Set&lt;Domain&gt; getDomains() {
 return _domains;
 }

 </pre>
<p>Now given an ID of a syslog server, I need to find if at all it is being used by any Domain entity. The purpose is to enable/disable a delete button on a JSF page whenever the entity is not in use.&nbsp;</p>
<p>The solution I came up with uses a native query and&nbsp; is as follows:</p>
<pre>
@SuppressWarnings(&quot;unchecked&quot;)
&nbsp;&nbsp;&nbsp; /*
&nbsp;&nbsp;&nbsp;&nbsp; */
&nbsp;&nbsp;&nbsp; public List&lt;SyslogServer&gt; findBySyslogId(SyslogServer sysLog) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _log.debug(&quot;Executing findBySyslogId for syslog:&quot; + sysLog);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Query q = _entityManager.createNativeQuery(
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SELECT o.* FROM NEO_SYSLOG o, NEO_DOM_SYSLG_MAP i WHERE (o.ID=i.SYSLOG_ID) AND o.ID=:SYSLOG_SERVER_ID_PARAM&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SyslogServer.class);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; q.setParameter(&quot;SYSLOG_SERVER_ID_PARAM&quot;, sysLog.getId());

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List sysLogServers = q.getResultList();

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (sysLogServers != null) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _log.debug(&quot;Collection size:&quot; + sysLogServers.size());
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ((List&lt;SyslogServer&gt;) sysLogServers);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //Avoid NPE
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _log.debug(&quot;Returning empty collection.&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return new ArrayList&lt;SyslogServer&gt;(0);
 } </pre>
<p>I am trying to find an alternative solution which would be as fast but would not involve a native query.&nbsp; Any ideas are welcomed, just make sure you understand the scenario.</p>
<p>Shlomo.</p>
