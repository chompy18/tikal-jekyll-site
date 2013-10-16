---
layout: default
title: Eclipse 3.4 crash under jdk 1.6.06 on linux
created: 1219741315
---
<pre wrap="" class="rteleft">
On Ubuntu Hardy Heron adding the following lines to the bottom of
eclipse.ini
makes the SIGSEGV crash go away for me:
-XX:CompileCommand=exclude,org/eclipse/core/internal/dtree/DataTreeNode,forwardDeltaWith
-XX:CompileCommand=exclude,org/eclipse/jdt/internal/compiler/lookup/ParameterizedMethodBinding,&lt;init&gt;


Bug report at
<a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=214092" class="moz-txt-link-freetext">https://bugs.eclipse.org/bugs/show_bug.cgi?id=214092</a>


</pre><p>&nbsp;</p>
