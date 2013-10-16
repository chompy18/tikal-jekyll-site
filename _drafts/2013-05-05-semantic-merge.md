---
layout: default
title: Semantic Merge
created: 1367736724
---
<p>&nbsp;</p>
<h4>
	a <strong>semantic</strong> merge tool...that <strong>understands</strong> your code</h4>
<p>&nbsp;</p>
<p>A friend of mine sent me this links. Looks interesting if a merge tool can really understand the code instead of just grasp the text changes&hellip; haven&rsquo;t tried it myself yet, but take a look at it <a href="http://semanticmerge.com/">http://semanticmerge.com/</a></p>
<p><img alt="What int does?" src="http://semanticmerge.com/assets/img/pictures/location.png" /></p>
<p>from <a href="http://msmvps.com/blogs/jon_skeet/archive/2013/04/18/new-tool-to-play-with-semanticmerge.aspx?utm_source=feedburner&amp;utm_medium=feed&amp;utm_campaign=Feed%3A+JonSkeetCodingBlog+%28Jon+Skeet%27s+Coding+Blog%29&amp;utm_content=Google+Reader">Jon Skeet blog</a> A</p>
<blockquote>
	<p>little while ago I was contacted about a new merge tool from the company behind <a href="http://www.plasticscm.com/">PlasticSCM</a>. (I haven&#39;t used Plastic myself, but I&#39;d heard of it.) My initial reaction was that I wasn&#39;t interested in anything which required me to learn yet another source control system, but SemanticMerge is independent of PlasticSCM.</p>
	<p>My interested was piqued when I learned that SemanticMerge is actually built on <a href="http://en.wikipedia.org/wiki/Microsoft_Roslyn">Roslyn</a>. I don&#39;t generally care much about implementation details, but I&#39;m looking out for uses of Roslyn outside Microsoft, partly to see if I can gain any inspiration for using it myself. Between the name and the implementation detail, it should be fairly obvious that this is a tool which understands changes in C# source code rather better than a plain text diff.</p>
	<p>I&#39;ve had SemanticMerge installed on one of my laptops for a month or so now. Unfortunately it&#39;s getting pretty light use &ndash; my main coding outside work is on <a href="http://noda-time.googlecode.com/">Noda Time</a>, and as I perform the vast majority of the commits, the only time I really need to perform merges is when I&#39;ve forgotten to push a commit from one machine before switching to another. I&#39;ve used it for diffs though, and it seems to be doing the right thing there &ndash; showing which members have been added, moved, changed etc.</p>
	<p>I don&#39;t believe it can currently support multi-file changes &ndash; for example, spotting that a lot of changes are all due to a rename operation &ndash; but even if it doesn&#39;t right now, I suspect that may be worked on in the future. And of course, the merge functionality is the main point.</p>
	<p>SemanticMerge is now in beta, so <a href="http://semanticmerge.com/">pop over to the web site</a> and give it a try.</p>
</blockquote>
