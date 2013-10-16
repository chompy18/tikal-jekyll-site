---
layout: default
title: Firing up the engines for multiple languages
created: 1219873101
---
<br />
<br />
<img style="width: 202px; height: 300px;" alt="" src="http://blogs.sun.com/dannycoward/resource/Babelfish_caption.jpg" align="left" />Have you seen the latest update from <a href="http://blogs.sun.com/jrose/">John</a> on our efforts to make the
<a href="http://openjdk.java.net/projects/mlvm/">JVM run multiple
languages</a> ? (I'm in a staff meeting writing this, but don't tell
anyone :) ).<br />
<br />
<span style="font-weight: bold;">From one to many languages</span><br />
<br />
For those of you who would like a little context around <a href="http://blogs.sun.com/jrose/entry/international_invokedynamic_day">International
Invokedynamic Day</a>, for the last few years we've been on a path
towards first class support for other languages on the JVM. No small
feat this, since the Java Platform was originally designed with one
language in mind. Now, we still believe that Java is the best language
for robust, long lived code. But we know that developers like to mix in
other languages that for special reasons: for particular applications,
for particular styles of development. Just as important, we've spent 13
years creating an incredibly scalable and high performing runtime
across a variety of operating systems. So for developers who create
applications with other languages (and we hope there will be many who
like <a href="https://openjfx.dev.java.net/JavaFX_Programming_Language.html">JavaFX
Script</a>), we figure they would like to run those apps on the <a href="http://blogs.sun.com/dagastine/entry/ultrasparc_t1_screams_running_java">best
runtime around</a>. <br />
<br />
So, as a matter of fact, do the creators of the engines for other
languages like <a href="http://www.ruby-lang.org">Ruby</a>, <a href="http://www.python.org/">Python</a>, <a href="http://groovy.codehaus.org/">Groovy</a>, <a href="http://www.scala-lang.org/">Scala</a> - they started creating
the engines to run on the Java Platform.<br />
<br />
<span style="font-weight: bold;">Lining up the engines</span><br />
<br />
So for Java SE 6, we provided a <a href="http://jcp.org/en/jsr/detail?id=223">framework</a> by which
those interpreters could <a href="https://scripting.dev.java.net/">plug
easily into the Java Platform</a>. And the developer APIs by which the
code from those other languages can be asked to execute. We even
bundled a JavaScript engine into our own JDK. At the same time, <a href="http://www.is-research.de/info/vmlanguages/">more and more
developers created the engines to run other languages on the Java
platform</a>.<br />
<br />
<span style="font-weight: bold;">Firing up the engines</span><br />
<br />
Now, many of the languages that are attracting the buzz that have been
invented since the Java language have a feature in common with each
other, but not with Java: they are <a href="http://en.wikipedia.org/wiki/Dynamic_typing#Dynamic_typing">dynamically
rather than statically typed</a>. So the types of the variables, method
parameters, return variables and so on are not known at development
time, unlike in Java where you are required to declare them. All very
nice for rapid prototyping and a more informal style of programming,
but a big problem for compiling it down to the Java bytecode because
the Java bytecode needs that type information filled out. So engines
for dynamic languages have to create artificial interfaces or classes
just to do the form filling. Making them brittle, difficult to maintain
and slower than they could be. But not if <a href="http://jcp.org/en/jsr/detail?id=292">we modify the bytecode</a>
to remove the need to fill out all the type information.<br />
<br />
So back to the update: John has <a href="http://hg.openjdk.java.net/mlvm/mlvm/hotspot/">prototyped
support for the modified bytecode in the HotSpot JVM</a> ! <br />
<br />
What this means is that implementors of dynamic language engines are
now free to try this out and <a href="http://www.infoworld.com/article/08/01/31/davinci-machine_1.html">prove
the theory</a>. I'm predicting that <a href="http://blog.headius.com/">Charlie</a>
will be one of the first with his <a href="http://jruby.codehaus.org/">JRuby
project</a>, but the race is on.<br />
<br />
Some of the newer languages have other features in common, like
closures for example. There may well be <a href="http://www.infoq.com/news/2008/03/jdl_shootout">other features</a>
we will build into the Java runtime to support such features better
like tail call recursions, continuations and lightweight method
handles. But we'll see how it goes with new bytecode and get some real
data and decide how much further we need to go. <br />
<br />
If, say, <a href="http://jruby.codehaus.org/">Ruby</a>, <a href="http://www.jython.org/Project/">Python</a> and <a href="http://www.scala-lang.org/downloads">Scala</a> run faster on the
JVM than anywhere else, we may just be done. For now :)<br />
<br />
<br />
