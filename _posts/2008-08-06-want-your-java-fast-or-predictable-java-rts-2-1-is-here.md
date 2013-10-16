---
layout: default
title: Want your Java fast or predictable ? Java RTS 2.1 is here
created: 1217991004
---
<br />
<br />
<span style="font-style: italic;"><img style="width: 125px; height: 180px;" alt="" title="Steady wins the race ?" src="http://blogs.sun.com/dannycoward/resource/i093.jpg" align="right" />When
you leave work, would you rather
it be likely that you get home really quickly, or would you rather be
sure you will get home by a certain time ?</span><br />
<br style="font-style: italic;" />
<span style="font-style: italic;">If you send a birthday card, would
you rather they try to get it there as soon as possible, or just know
it will definitely get there on the day ?</span><br />
<br />
<span style="font-style: italic;">If you order something for yourself
on Amazon, do you pick the cheapest delivery option because most of the
time it gets there 2 days after it ships even though it doesn't say so ?<br />
<br />
</span><span style="font-weight: bold;">Fast, and Better Late than
Never, but...</span><span style="font-style: italic;"><br />
</span><br />
<img title="Darling, don't forget to pick up the kids" style="width: 160px; height: 119px;" alt="" src="http://blogs.sun.com/dannycoward/resource/clarkson_face.jpg" align="left" />For many years, we have focussed in Java SE on making the
runtime fast. Fast in a number of ways: fast to render graphics (in
particular, in the <a href="http://java.sun.com/javase/downloads/ea.jsp">upcoming 6u10
release</a>), fast to execute server
applications, fast to start up, for example. And if you follow <a href="http://blogs.sun.com/dagastine">Dave Dagastine's blog</a> you
will know that we <a href="http://blogs.sun.com/dagastine/entry/first_specjvm2008_result_published">frequently
hold the gold medal</a> for various of the races laid out by the <a href="http://www.spec.org/benchmarks.html#java">SPEC</a>.<br />
<br />
But one thing the <a href="http://java.sun.com/javase/technologies/hotspot/">HotSpot JVM</a>
is not tuned for is <span style="font-weight: bold; font-style: italic;">hard predictability</span>.
That is to say, there is no
guarantee that a certain task will take no longer than a certain amount
of time. The native OS may choose to schedule something ahead of the
JVM process supporting your application. Classloading or performance
optimizations such as just-in-time compilations may put your
application thread in the backseat. Or, probably most recognizable to
users of your application, a garbage collection may kick in when you
least expect it. Such
non-deterministic behavior is just fine for many applications.
Moreover, it allows the JVM to tune for big picture performance
characteristics,
like overall throughput averaged over a complete run of your
application, even if one or two of your application tasks unexpectedly
end up taking longer than you thought. The needs of the many
outweighing the needs of the few, <a href="http://www.imdb.com/title/tt0084726/quotes">in Vulcan</a>.<br />
<br />
<img title="I know I will get to work at 8.57" style="width: 160px; height: 107px;" alt="" src="http://blogs.sun.com/dannycoward/resource/man_notebook_train_taw2046b_0210.JPG" align="right" />But anyone who has been late picking up a small child
from daycare will know that there are some tasks that just <span style="font-style: italic;">have</span> to get
done within a certain time period. Even if it's at the expense of
completing others
you thought you might have time for.<br />
<br />
<span style="font-weight: bold;">...sometimes, Best is Never Late</span><br />
<br />
So for nearly as many years as we have had been tuning performance in
the JDK, <a href="http://research.sun.com/people/bollella/">Greg has
been leading</a> our real-time variant of Java SE, called the <a href="http://java.sun.com/javase/technologies/realtime/">Java Real
Time System (Java RTS)</a>. This implementation is at the other end of
the predictability versus speed continuum, where your application may
select tasks (zero to all of them) as tasks that must complete within a
given time period. There is no 'better late than never' here: late
equals failure for this implementation of Java SE.<br />
<br />
<span style="font-weight: bold;">Java RTS 2.1 is Released !</span><br />
<br />
And Java RTS recently hit a new milestone with a significant upgrade to
version 2.1, which <a href="http://java.sun.com/javase/technologies/realtime/rts/">you can
check out here</a>.<br />
<br />
The main elements of Java RTS over the usual Java SE you are probably
more familiar with are:-<br />
<ul>
<li>the javax.realtime.* APIs</li>
</ul>
In addition to the regular Java SE APIs, these APIs allow you to code
parts of your application with the real-time guarantees it needs. This
means Java RTS runs regular Java SE applications, but provides no
realtime guarantees to any of the tasks in the application unless you
adapt the application to use the javax.realtime APIs to ask for those
guarantees.<br />
<ul>
<li>a VM tuned for realtime behavior</li>
</ul>
For example, containing a garbage collector that runs at a lower
priority than real time application threads so as not to delay them.<br />
<ul>
<li>Bindings to the realtime aspects of the underlying OS</li>
</ul>
The realtime system is only as good as the underlying OS can guarantee
(which is why we only offer it on Solaris and some Linux
distributions). These bindings, for example, ensure that JVM threads
are properly scheduled by the OS scheduler.<br />
<br />
Our own <a href="http://ajax.sys-con.com/node/617842">Paul Hohensee</a>
and <a href="http://java.sun.com/developer/technicalArticles/Programming/rt_pt1/">Brian
Goetz</a> have been writing in detail about both the additional
programming APIs and the implementation, <a href="http://ajax.sys-con.com/node/617842">here</a> and <a href="http://java.sun.com/developer/technicalArticles/Programming/rt_pt1/">here</a>.<br />
<br />
<br />
We've got folks using the Java RTS in traditional settings like
industrial automation projects, an of course in robots - where the
multiple processing involved in moving a complex limb have to be
coordinated, <a href="http://java.sun.com/javaone/sf/2008/articles/gosling_toystory.jsp"><span style="text-decoration: underline;">even at</span> JavaOne</a>.. But
more recently we have a lot of interest in the financial world from
folks writing trading applications, where certain timing guarantees
need to be met.<br />
<br />
In a world where <a href="http://www.youtube.com/watch?v=RuQmgEtdAYg">even
driving in a circle can get crazy</a>, its good to know you can choose
Predictable if you need it.<br /><br />
