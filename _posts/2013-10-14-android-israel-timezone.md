---
layout: post
title:  Android – Israel Timezone
created:   1381771364
tags: Android timezone
category: Incubator
author: avi-tzurel
excerpt: For all those Israelis that have an android but have the wrong time/time zone 
---
<div class="MsoNormal">&nbsp;</div>

<h1>Android &ndash; Israel Timezone<o:p></o:p></h1>

<div class="MsoNormal">For all those Israelis that have an android but have the wrong time/time zone since Israel keeps on changing the date of day light savings, this procedure is for you. <o:p></o:p></div>

<h1>Download updated <a href="http://s000.tinyupload.com/download.php?file_id=00221707530400639773&amp;t=0022170753040063977373544"><span style="color: #365f91; mso-themecolor: accent1; mso-themeshade: 191; text-decoration: none; text-underline: none;">tzdata</span></a>&nbsp;<o:p></o:p></h1>

<div class="MsoNormal"><a href="http://s000.tinyupload.com/?file_id=00221707530400639773">http://s000.tinyupload.com/?file_id=00221707530400639773</a><o:p></o:p></div>

<div class="MsoNormal">For more information see <a href="http://iandroid.co.il/forum/topic143622.html">http://iandroid.co.il/forum/topic143622.html</a><o:p></o:p></div>

<div class="MsoNormal">&nbsp;</div>

<h1>Android adb<o:p></o:p></h1>

<div class="MsoNormal">Make sure you have the android adb (<a href="http://developer.android.com/sdk/index.html">http://developer.android.com/sdk/index.html</a>)<o:p></o:p></div>

<div class="MsoNormal">&nbsp;</div>

<h1>Connection to your device<o:p></o:p></h1>

<div class="MsoNormal">To test your connection type in the dos prompt: adb devices.<o:p></o:p></div>

<div class="MsoNormal">You should get a list like<o:p></o:p></div>

<div class="separator" style="clear: both; text-align: center;"><a href="http://1.bp.blogspot.com/-c3dyNQ76uZo/Ulwn5YDoLaI/AAAAAAAAIC4/ERdtPb6JPT4/s1600/Capture.JPG" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="80" src="http://1.bp.blogspot.com/-c3dyNQ76uZo/Ulwn5YDoLaI/AAAAAAAAIC4/ERdtPb6JPT4/s640/Capture.JPG" width="640" /></a></div>

<div class="MsoNormal"><!--[if gte vml 1]><v:shapetype
 id="_x0000_t75" coordsize="21600,21600" o:spt="75" o:preferrelative="t"
 path="m@4@5l@4@11@9@11@9@5xe" filled="f" stroked="f">
 <v:stroke joinstyle="miter"/>
 <v:formulas>
  <v:f eqn="if lineDrawn pixelLineWidth 0"/>
  <v:f eqn="sum @0 1 0"/>
  <v:f eqn="sum 0 0 @1"/>
  <v:f eqn="prod @2 1 2"/>
  <v:f eqn="prod @3 21600 pixelWidth"/>
  <v:f eqn="prod @3 21600 pixelHeight"/>
  <v:f eqn="sum @0 0 1"/>
  <v:f eqn="prod @6 1 2"/>
  <v:f eqn="prod @7 21600 pixelWidth"/>
  <v:f eqn="sum @8 21600 0"/>
  <v:f eqn="prod @7 21600 pixelHeight"/>
  <v:f eqn="sum @10 21600 0"/>
 </v:formulas>
 <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
 <o:lock v:ext="edit" aspectratio="t"/>
</v:shapetype><v:shape id="Picture_x0020_1" o:spid="_x0000_i1025" type="#_x0000_t75"
 style='width:468pt;height:60pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="file:///C:\Users\Chaimt\AppData\Local\Temp\msohtmlclip1\01\clip_image001.png"
  o:title=""/>
</v:shape><![endif]--><!--[if !vml]--><!--[endif]--><o:p></o:p></div>

<div class="MsoNormal">&nbsp;</div>

<div class="MsoNormal">Copy the tzdata file to the same folder as the adb.<o:p></o:p></div>

<div class="MsoNormal">&nbsp;</div>

<div class="MsoNormal">Run the following commands<o:p></o:p></div>

<div class="MsoNormal">&nbsp;</div>

<div class="MsoNormal">adb root<br />
adb remount<br />
adb push tzdata /system/usr/share/zoneinfo/<br />
adb shell chmod 644 /system/usr/share/zoneinfo/tzdata<br />
adb reboot<o:p></o:p></div>

<div class="MsoNormal">&nbsp;</div>

<div class="MsoNormal">You should now have the correct time and time zone.<o:p></o:p></div>

<div class="MsoNormal">&nbsp;</div>

<p>&nbsp;</p>

<div class="MsoNormal">&nbsp;</div>

<p>&nbsp;</p>
