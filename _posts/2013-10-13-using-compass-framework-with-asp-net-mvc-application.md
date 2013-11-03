---
layout: post
title: Using Compass framework with ASP.NET MVC application.
created: 1381672610
tags: compass asp .net mvc
category: .NET
author: menny-rachmanny
excerpt: In my previous post I dexcribed how to start working with SASS
---
<p>In my previous&nbsp;<a href="http://igorzelmanovich.blogspot.co.il/2013/10/add-power-of-sass-to-aspnet-application.html">post</a>&nbsp;I described how to&nbsp;<a href="http://igorzelmanovich.blogspot.co.il/2013/10/add-power-of-sass-to-aspnet-application.html">start working with SASS using Mindscape Web Workbench</a>.<br />
<br />
In this post I am taking next step - start working with&nbsp;<a href="http://compass-style.org/">Compass - CSS Authoring Framework</a>.<br />
<br />
Immediately after installing&nbsp;<a href="http://www.mindscapehq.com/products/web-workbench">Web Workbench</a>, you can create/edit&nbsp;<a href="http://sass-lang.com/">SCSS</a>&nbsp;file, which are compiled into CSS. By default, Web Workbench compile SCSS files with SASS compiler. &nbsp;But there is a trick:</p>

<h3>Setup Compass Project</h3>

<p>Right click on project node in solution explorer, then select &quot;Setup Compass Project&quot;<br />
&nbsp;</p>

<div><a href="http://4.bp.blogspot.com/-IRgPzvS--YI/Ulp89RkY5ZI/AAAAAAAAXDk/Y891WMpcG4Y/s1600/2013-10-13_13h57_58.png" imageanchor="1"><img border="0" src="http://4.bp.blogspot.com/-IRgPzvS--YI/Ulp89RkY5ZI/AAAAAAAAXDk/Y891WMpcG4Y/s640/2013-10-13_13h57_58.png" /></a></div>

<p><br />
It will change your project by adding&nbsp;&quot;sass&quot;&nbsp;folder with&nbsp;&quot;ie.scss&quot;, &quot;print.scss&quot;&nbsp;and&nbsp;&quot;screen.scss&quot;&nbsp;files and compass project configuration file&nbsp;&quot;config.rb&quot;&nbsp;in root.<br />
<br />
&quot;config.rb&quot;&nbsp;is a&nbsp;<a href="https://www.ruby-lang.org/en/">Ruby</a>&nbsp;file, contains&nbsp;<a href="http://compass-style.org/help/tutorials/configuration-reference/">configuration properties</a>, such&nbsp;&quot;css_dir&quot;&nbsp;- the directory where the css stylesheets are kept and&nbsp;&quot;sass_dir&quot;&nbsp;- the&nbsp;directory where the sass stylesheets are kept.<br />
<br />
From now, all SASS files, located in&nbsp;&quot;sass_dir&quot;&nbsp;will be complied by Compass compiler and, accordingly, CSS output files will be stored in&nbsp;&quot;css_dir&quot;.<br />
<br />
If you don&#39;t want to change your ASP.NET project layout, you might prefer to change Compass configuration.&nbsp;<br />
<br />
I prefer to keep all SCSS files in separate directory, therefore I created &quot;Content/scss&quot; folder and moved existing *.scss files there.<br />
Then I changed config.rb file as bellow:</p>

<blockquote><br />
# Set this to the root of your project when deployed:<br />
http_path = &quot;/&quot;<br />
css_dir = &quot;Content&quot;<br />
sass_dir = &quot;Content/scss&quot;<br />
images_dir = &quot;images&quot;<br />
javascripts_dir = &quot;Scripts&quot;</blockquote>

<div>&nbsp;</div>

<div>Now Web Workbench recognizes scss files as part of Compass project and runs Compass compiler against them. Output css files remain in the same place, so no need to update views.</div>

<p>&nbsp;</p>

<h3>Get Magic of Compass</h3>

<p>Just open&nbsp;<a href="http://compass-style.org/reference/compass/">Compass API references</a>&nbsp;and start coding.<br />
<br />
Lest consume one of basic features of Compass - Reset.<br />
<br />
add following line in beginning of SCSS file<br />
<br />
&nbsp;@import &quot;compass/reset&quot;;<br />
<br />
The only line will generate plenty of reset rules in output css<br />
&nbsp;</p>

<div><a href="http://4.bp.blogspot.com/-2DuIuVW4MBA/UlqF9o8_zNI/AAAAAAAAXD0/xLXt9DTW6rk/s1600/2013-10-13_14h35_43.png" imageanchor="1"><img border="0" src="http://4.bp.blogspot.com/-2DuIuVW4MBA/UlqF9o8_zNI/AAAAAAAAXD0/xLXt9DTW6rk/s640/2013-10-13_14h35_43.png" /></a></div>

<p>&nbsp;</p>

<div>Isn&#39;t it a magic?!</div>

<div>&nbsp;</div>

<div>Compass has a lot of useful features, and all of them are available in your ASP.NET application.</div>
