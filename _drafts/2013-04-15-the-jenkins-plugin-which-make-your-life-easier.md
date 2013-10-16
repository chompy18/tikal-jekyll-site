---
layout: default
title: The Jenkins plugin which make your life easier
created: 1366013609
---
<ul>
	<li>
		<h4>
			EnvInject Plug-in</h4>
		<h3>
			&nbsp;</h3>
		<p>At times when you have to inject parameters and you do not know exactly what params you want - or you can calculate them dynamically with some helper script (bash / ksh / groovy / you name it )<br />
			This plug-in is a life saver: <img alt="EnvInject script" src="EnvInject-script-content.png" /></p>
	</li>
	<li>
		<h4>
			Extended Choice Parameter Plug-in</h4>
		<h3>
			&nbsp;</h3>
		<p>Provides the ability to customize build executions with complex parameters</p>
		<p>This job serves a QA team to:</p>
		<p>&nbsp;</p>
		<p>The configuration looks like this:<br />
			<img alt=" Config" src="Extended_Choice_Config.png" /></p>
		<p>The execution looks like so:<br />
			<img alt=" Execute" src="Extended_Choice.png" /></p>
		<p>The main build target can now use any option as a parameter<br />
			In my case I use something like the following:<br />
			<code>
					 		#!/bin/bash<br />
							TOKEN=qa<br />
							USER=my_user<br />
							PASS=my_pass<br />
							machines=`echo $machine | tr "," " "`<br />
							for build in ${machines}; do<br />
							wget --auth-no-challenge --http-user=${USER} --http-password=${PASS} "${HUDSON_URL}job/Auto.CRE_v3.0.0-Jsystem-${build}-Modelregression/buildWithParameters?token=${TOKEN}&amp;scenario=${scenario}&amp;CreMajorVersion=${CreMajorVersion}&amp;model=${model}&amp;model_version=${model_version}&amp;installer=${installer}"#&amp;cause=Triggered By ${JOB_NAME}-${BUILD_NUMBER} <br />
							done<br />
							wait<br />
					 </code></p>
		<ol>
			<li>
				Set the Job Names the QA teams wish to execute</li>
			<li>
				Set the Brach version in the SCM</li>
			<li>
				Set the Major version of the build - passed as an argument to maven</li>
			<li>
				Anything else you might think of - for example pass a variable to the build description setter plug-in to set</li>
			<li>
				<h4>
					MultiJob Plug-in</h4>
				<p>&nbsp;</p>
			</li>
			<li>
				<h4>
					Configuration Slicing Plug-in</h4>
				<p>This plugin has gone a long way from where it started it now supports almost any Slicing you may want to perform on Parameters, Maven Versions, JDK version and much more:</p>
				<p><img src="Configuration_Slicing.png" /><br />
					A great example is if your team has decided to change the &quot;time to keep builds policy&quot; you want to do this to your entire instance and you do not want to risk it with t groovy snippet [for you might write it wrong ... :) and muck up your entire instance!]</p>
			</li>
			<li>
				<h4>
					Template Plug-in (a.k.a &quot;DRY&quot; plug-in)</h4>
				<p>I can&#39;t stress how much time it took me to wrap my head around using this plug-in (in an efficient way) ill try to give you the steps of what I did</p>
				<ul>
					<li>
						Create a &quot;FreeStyle&quot; project [It must be a free style one or it doesn&#39;t work :(]</li>
					<li>
						In the new &quot;FressStyle&quot; project in your main build step do whatever you want: e.g Execute shell / groovy / ruby etc etc</li>
					<li>
						Re use that snippet / job in other jobs / promotions</li>
				</ul>
				<p><img alt="reuse" stc="Template-ReUse" /></p>
			</li>
			<li>
				<h4>
					Pre-SCM-Buildstep Plugin</h4>
				<p>&nbsp;</p>
				<p>Worth noting the following (when using this plug-in of course ...):</p>
				<ol>
					<li>
						The SCM may <b>modify or remove</b> any files that are in the workspace, before the main build steps.</li>
					<li>
						Environment variables may not exist at this point - set them beyond this point<br />
						IMHO this is a good thing for one of the main usages of this plug-in (for me at least) was to set the P4CHANGELIST variable in order to determine which Perforce change list I am releasing in this build - my Pre SCM script would parse the &quot;selected build&quot; log and extract the change-list I I going to build in this release build. (If you need further info on this drop me a <a>line</a>)</li>
					<li>
						Failed build steps will not cause the job to fail - Important!, but you should have better things to worry about ... if you job failsm it would probably fail somewhere else ... :)</li>
				</ol>
				<p>&nbsp;</p>
			</li>
			<li>
				<h3>
					&nbsp;</h3>
				<p>&nbsp;</p>
			</li>
			<li>
				<h3>
					&nbsp;</h3>
				<p>&nbsp;</p>
			</li>
			<li>
				<h3>
					&nbsp;</h3>
				<p>&nbsp;</p>
			</li>
			<li>
				<h3>
					&nbsp;</h3>
				<p>&nbsp;</p>
			</li>
			<li>
				<h3>
					&nbsp;</h3>
				<p>&nbsp;</p>
			</li>
		</ol>
	</li>
</ul>
