---
layout: default
title: Subversion 1.5.2 on ubuntu
created: 1222983210
---
<p><span style="display: none;">&nbsp;</span></p><p>Subversion 1.5 is out for some time now but no one in the ubuntu project add an apt-get package to the repositories. Until it will be done, using svn 1.5 on ubuntu box mean building subversion from source in the good old Linux way.</p><p>Subversion provide a ready to build tarball using gnu utils. Once downloaded and untar - cd into the root folder (subversion-1.5.2 in my case) and run:</p><pre>
$./configure
&lt;long output ...&gt;
$make
&lt;even longer output ...&gt;
$sudo make install</pre><p>And that it. well - almost.</p><p>I came across some issues during the process:</p><p>1. <u>Not all gcc libereries where installed by my default ubuntu installation.</u></p><p>After some googling on the <strong>./configure</strong> error massege i used synaptic to add:</p><pre>
libc6-dev (2.7-10ubuntu4)
Linux-libc-dev (2.6.24-19.41)</pre><p>And <strong>./configure</strong> exit with no erors.</p><p>2. <u>No apr was found</u>.</p><p>Synatic again, this time i add:</p><pre>
libapr1 (1.2.11-1)
libaprutil1 (1.2.12+dfs- 3)</pre><p><br />Apache-common and some other apache stuff came along as dependencies. Fine by me - i want to install server as well at the next stage. <strong>make</strong> was running withno error now.</p><p>3. <u>No neon</u>.</p><p>This one was the tricky one. '<strong>Make</strong>' works fine as well as '<strong>make install</strong>'. svn is in the path and everyone is happy. But trying to checkout from Tikals repo gave the error:</p><pre>
svn: unrecognized url schema</pre><p>The client cant &quot;talk&quot; http://. So i went back to synaptic and add:</p><pre>
libneon27-dev (0.27.2-1)</pre><p>Oops. The compilation that worked before i add neon is not working anymore. The error <strong>make</strong> returned was:</p><pre>
no such file libneon.la. 
</pre><p>Apparently&nbsp; there is a bug in ubuntu neon disro. (<a href="https://bugs.launchpad.net/ubuntu/+source/neon26/+bug/96700">Bug #96700</a>): the file <strong>libneon.la</strong> is missing from the package. I used the workaround recommended in the bug report and edit <strong>Makefile</strong>: changing <em>libneon.la</em> to <em>libneon.so</em> . The main problem with this solution is that <strong>Makefile</strong> is being rewritten every run of <strong>./configure</strong>. So if you change configuration you should re-edit the <strong>Makefile</strong>.</p><p>There is another way to bypass this issue; subversion provide a subversion-deps tarball with the source of all dependencies. Including APR, neon and some others. I tried to avoid building the dependencies and use the distro binaries because of a hole set of 2nd degree dependencies that can easily become a nightmare.</p><p>&nbsp;</p><p><span style="display: none;">&nbsp;</span></p><p>&nbsp;Links:</p><p><a href="http://subversion.tigris.org/downloads/subversion-1.5.2.tar.bz2">subversion 1.5.2</a></p><p><a href="http://subversion.tigris.org/downloads/subversion-deps-1.5.2.tar.bz2">subversion-deps 1.5.2</a></p><p>&nbsp;</p>
