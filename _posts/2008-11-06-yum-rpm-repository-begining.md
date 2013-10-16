---
layout: default
title: Yum-RPM repository - Begining
created: 1225958516
---
<p>Ok so as part of the installation process at Tikal we need a few rpm &amp; apt-get packadges in order to install ALM, I recentlly added a small repository of collected rpms for rl5 (RHEL5 / CentOs5) - is is accessible via http://tux.tikalk.com/tikal-repos/rl5/ which is now on a test site - but is checked an working</p> <p>As of now ther are only Pel prms which are used as Bugzilla installation prequiesets.</p> <p>&nbsp;</p> <p>In order to test-run / enable this repository on a RedHat / CnetOs system perform the following tasks:</p> <p>create a file called: tikal.repo under the directory /etc/yum.repos.d/</p> <pre><p>[my machine]# vim /etc/yum.repos.d/tikal.repo</p></pre> <p>copy 'n' paste the following lines:</p> <pre><p>[tikal]</p>
<p>baseurtl=http://tux.tikalk.com/tikal-repos/rl5</p>
<p>enabled=1</p></pre> <p>&nbsp;</p> <p>you can also have enabled=0 but if you want to install from the repository yoiu will have to run the following command:</p> <pre>
yum --enablerepo=tikal install &lt;packagename&gt;</pre> <p>&nbsp;</p><p>This will follwo by an Apt-Get repository and a CentOs 4 / rl4 - for now I a building only the necesary repos.</p><p>&nbsp;</p> <p>&nbsp;</p>
