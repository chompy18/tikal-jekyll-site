---
layout: default
title: Make Intel PRO/Wireless 3945ABG work for Ubuntu 8.04
created: 1209754980
---
<p>After installing Ubuntu 8.04 on my T60, I was supprised that wifi network card does not work at all.</p><p>After searching and googling I found next:  In the kernel 2.6.24 driver for Intel PRO/Wireless Card 3945ABG was replaced from ipw3945 to iwl3945, and because of some bugs it does not work by default.</p><p>Google has a lot of suggestions about this issue, and after two days probing each of them, workable solution was found.    Workaround is :</p><p>1. sudo modprobe -r iwl3945</p><p>2. sudo modprobe iwl3945</p><p>3. create a file named iwl3945 in /etc/modprobe.d/</p><p>3. in the file type the following and save:<br /><b>&nbsp;&nbsp;&nbsp; alias wlan0 iwl3945</b>  <br /><b>&nbsp;&nbsp;&nbsp; options iwl3945 disable_hw_scan=1</b>  <br />&nbsp;&nbsp;&nbsp; <span style="font-weight: bold;">sudo ifconfig wlan0 up  </span></p><p>reboot  Enjoy your wireless connection</p>
