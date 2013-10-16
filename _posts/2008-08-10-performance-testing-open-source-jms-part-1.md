---
layout: default
title: Performance testing open source JMS part 1
created: 1218381618
---
<p><em>Matt Brasier, a consultant with niche Java EE consultancy C2B2 Consulting, compares the performance of <strong>JBoss Messaging</strong>, <strong>JBoss MQ</strong> and <strong>Sun Java System Message Queue</strong>, in their out of the box configurations. This first article looks at the performance of these three implementations when sending messages to a JMS queue. The results indicate that the overhead of establishing a connection to a server, and looking up a queue is lowest in JBoss MQ, but that JBoss Messaging is the fastest at actually sending a message. However the time taken to send messages tends towards 1-2ms in all implementations. The testing also highlights the importance of configuring your JMS server to protect your application server from running out of memory.</em></p>
