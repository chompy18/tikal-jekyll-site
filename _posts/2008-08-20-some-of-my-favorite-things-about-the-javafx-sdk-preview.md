---
layout: default
title: Some of my favorite things about the JavaFX SDK Preview
created: 1219200601
---
<br />
<br />
<img style="width: 200px; height: 263px;" alt="" src="http://blogs.sun.com/dannycoward/resource/egg.jpg" align="right" />I'm
sure you all saw that our <a href="http://javafx.com">JavaFX</a> team <a href="http://java.sun.com/javafx/downloads/">released a preview of the
SDK</a> at the end of July. I've been happily tinkering with it for the
last few days. If you are hacking with <a href="http://www.ajax.org/">AJAX</a>,
moonlighting with <a href="http://silverlight.net/">Silverlight</a>,
or fumbling with <a href="http://www.adobe.com/products/flex/">Flex</a>,
I think you should get up close and personal with it too, and <a href="http://www.youtube.com/watch?v=pffLa7WkvUc">see what its all
about</a>.<br />
<br />
We've been <a href="http://java.sun.com/javaone/sf/media_shell.jsp?id=FRdamp267558">talking
about JavaFX</a> in various ways for <a href="https://openjfx.dev.java.net/JavaFX_FAQ.html">some time</a> now,
so you <a href="http://java.sun.com/javafx/">probably already know</a>
that its for building rich client applications, that it itself is built
using Java, and that it will span multiple devices - from small mobile
phones through TV settop boxes to the PC desktop and browser. Most
importantly, if you are a traditional Java programmer (I include
myself), you will notice there's a paradigm shift. A shift moving from
the Java programming environment, whose generality spans quite an <a href="http://java.sun.com/javacard/">astonishing</a> <a href="http://java.sun.com/javame/index.jsp">range</a> <a href="http://java.sun.com/javase/">of</a> <a href="http://java.sun.com/javaee/">applications</a>, to a programming
environment specially designed for those amongst us with more developed
visual design skills than technical ones (sadly, I cannot include myself).
Those who are focused on one kind of application: interactive and
fabulous looking.<br />
<br />
Looking ahead a little, <a href="http://www.internetnews.com/dev-news/article.php/3762641/Sun+Moves+JavaFX+Closer+to+Primetime.htm">the
plan here</a> is to release the final version of the SDK for the
desktop at the end of this year and a preview of the mobile version
next March or so. I say or so, not just because schedules are
schedules, but because we are ready to adjust based on the <a href="http://learnjavafx.typepad.com/weblog/2008/08/i-hear-voices-p.html">feedback</a>
we get from this preview release.<br />
<br />
Anyhow, some of my favorite things about this <a href="http://java.sun.com/javafx/downloads/">preview release</a> are:-<br />
<br />
<span style="font-weight: bold; font-style: italic;">The Language:
JavaFX Script</span><br />
<br />
Described in full in the <a href="http://openjfx.java.sun.com/current-build/doc/reference/JavaFX-Language.html">language
guide</a> included in the SDK, this new language is highly declarative
(i.e. it says what its going to do, rather than saying how to do it),
with features like <span style="font-weight: bold;">data binding</span>
to let you to bind one variable to another variable. Like, <br />
<br />
<span style="font-style: italic;">let oneVariable = bind
anotherVariable;</span><br />
<br />
(I did say it was declarative). Or like the <span style="font-weight: bold;">triggers</span> feature, so that when the
value of one variable is replaced, you can have something else happen
at the same time.<br />
<br />
<span style="font-style: italic;">attribute oneVariable</span><br style="font-style: italic;" />
<span style="font-style: italic;">&nbsp;&nbsp;&nbsp; on replace
doSomethingElse();</span><br />
<br />
To a Java programmer its going to be an <a href="http://learnjavafx.typepad.com/">easy new language to pick up</a>
because it shares much of its syntax with the Java language. To a
designer, its going to be an <a href="http://learnjavafx.typepad.com/">easy
new language to pick up</a> because its clean, straightforward and does
on the screen what it says in the code. And it has no <a href="http://bliki.rimuhosting.com/space/knowledgebase/linux/misc/ajax+autocomplete">baggage
to carry</a>.<br />
<br />
<span style="font-weight: bold; font-style: italic;">The APIs</span><br />
<br />
Neatly divided into two profiles (<a href="http://javafx.com/releases/preview1/docs/api/">which you can see
here</a>) - the <span style="font-weight: bold;">common</span> <span style="font-weight: bold;">profile</span> for all the APIs that will
be available on every device, and the <span style="font-weight: bold;">desktop
profile</span> for all the APIs that make sense only for applications
on a desktop. There's a <span style="font-weight: bold;">mobile profile</span>
to come of course in the mobile release next year, which will have the
common profile plus APIs that make sense on mobile devices.<br />
<br />
As part of the common profile, you have the <a href="https://scenegraph.dev.java.net/">scene graph</a> and the media
JavaFX APIs. The GUI of an application is modeled as a graph of visual
nodes, (each node being a shape, line, piece of text, GUI widget or
embedded media), that moves, twists, rearranges as the user interacts
with it. The scene graph API in JavaFX is especially well suited to the
transition effects and animations that make all the difference between
a user experience and a captivating user experience. The media
supported in the scene graph includes a <a href="http://javafx.com/releases/preview1/docs/api/javafx.scene.media/javafx.scene.media.MediaPlayer.html">player
control</a> and support for OS native formats. You'll remember we <a href="http://www.on2.com/index.php?id=439&amp;news_id=622">inked a deal
with On2</a> to provide cross device media support in May. Well that
will have to wait a little longer before we can put that in. But we're
all crossing our scene graph nodes that it will be soon.<br />
<br />
The desktop profile includes the common profile, plus some desktop
specific extras like...many of the tried and tested Swing widgets we
know and love: buttons, combo boxes, lists and so on. So no shortage of
the basics you need there.<br />
<br />
And of course, <a href="https://openjfx.dev.java.net/">being built in
Java and on Java</a>, you can always reach down into the underlying
Java APIs for your favorite Java API if you would like to use that in
your application too. <br />
<br />
<img style="width: 165px; height: 234px;" alt="" src="http://blogs.sun.com/dannycoward/resource/mask.jpg" align="left" /><span style="font-weight: bold; font-style: italic;">NetBeans integration
and Project Nile Plugins</span><br />
<br />
Naturally, the <a href="http://javafx.netbeans.org/">SDK is available
pre-integrated with NetBeans 6.1</a> which is how I've been looking at
it, as <a href="http://www.javalobby.org/java/forums/t103252.html">have
others</a>. The language and APIs are supported in the IDE with all the
things you would expect like syntax coloring and checking, debugging
and so on. Together a <a href="http://java.sun.com/javafx/tutorials/jfx_nb_getting_started/">tutorial</a>
and a range of samples. The samples are generally short and to the
point. Want to see how to draw polygons ? There's a sample just for
that. Want to see how to use keyframe animation to bring life to
randomly moving particles ? There's a sample just for that.
Transparency, color gradients, bounce a ball ? Check, check, check.<br />
<br />
Also included in the SDK is a collection of plugins (<a href="http://java.sun.com/javafx/reference/project_nile_installing/">codenamed
Project Nile)</a> to Adobe Photoshop and Illustrator so you can keep
working on the art there, and use Project Nile to export it into your
JavaFX application and bring some life to it. <br />
<br />
<br />
My other favorite thing is that this is all running on Java SE. So
applications created in JavaFX aren't just running on any old VM, its
running on a supremely stable, <a href="http://www.infoq.com/news/2008/05/hotspot_performance">scalable</a>
and <a href="http://blogs.sun.com/dagastine/entry/sun_java_on_intel_delivers1">high
performing</a> runtime. But I don't have time to tell you about all
that just now. <br />
<br />
<br />
There's more to the SDK than just my favorite things. If you've been
curious about JavaFX, now is a good time to <a href="http://java.sun.com/javafx/downloads/">take a look for yourself</a>.<br />
<br />
<br />
