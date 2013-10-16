---
layout: default
title: Slimming and Tuning JBoss 4.0.5 at Customer
created: 1218981656
---
<p>The following document presents the services that were slimmed and the tuning improvements that were made to JBoss 4.0.5 at Customer site. These are the sections:</p>
<ol>
    <li>
    <p>Services that were slimmed from 	JBoss</p>
    </li>
    <li>
    <p>Tuning improvements in JBoss</p>
    </li>
    <li>
    <p>Services that (theoretically) 	can be removed but are being used by the application</p>
    </li>
    <li>
    <p>Services that can be removed 	and were removed before I got to customer site.</p>
    </li>
</ol>
<p><font color="#0000ff"><span>	</span><u><b>Performance improvements</b></u></font></p>
<p><font color="#0000ff">	the following results were achieved on the <i>getafix</i><span> linux machine:</span></font></p>
<p><font color="#0000ff"><span>	for constant throughput (TP), the average response time </span><span><b>(AVG) was 	reduced in 15%</b></span><span> (from 134 to 116).</span></font></p>
<p><font color="#0000ff"><span>	for maximal TP, the </span><span><b>AVG was reduced in 33%</b></span><span> (from 167 to 125), and 	the </span><span><b>TP increased in 32%</b></span><span><span> (from 41.6 to 55.2)</span></span><span>.</span></font></p>
<p><font color="#0000ff">	In the slimmed version, as time goes by (after 20000 samples), the TP 	starts to increase and the AVG starts to decrease. On the other hand, 	the un-slimmed version shows no change in either TP and AVG, not 	even after 50000 samples.</font></p>
<p><font color="#0000ff">	So &ndash; in order to see the improvements made by the slimmed version, 	the tests should include at least 50000 samples.</font></p>
<p><font color="#0000ff"> </font></p>
<p><span>	</span><u>Notes before starting</u></p>
<ul>
    <li>
    <p>At the application, there are 3 server 	platforms: Windows, Solaris and Linux. This document is relevant to 	all of them. According to JBoss documentation, there&rsquo;s no 	difference between these platforms regarding the slimming &amp; 	tuning issues.</p>
    </li>
    <li>
    <p>In each section, along with the 	service name, there&rsquo;s an explanation on how to remove it.</p>
    </li>
    <li>
    <p>All paths mentioned in this 	document are assumed to start with <i>server/xxx/</i>.</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<p><font color="#4f81bd"> <font size="4"><i><b>Slimmed services</b></i></font></font></p>
<ol>
    <li>
    <p><b>Mail Service</b> (J2EE 	standard JavaMail client)</p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>deploy/mail-service.xml</p>
    </li>
    <li>
    <p>lib/mail* (mail-plugin.jar, 	mail.jar)</p>
    </li>
    <li>
    <p>lib/activation.jar (Java 	Activation Framework is used by JavaMail)</p>
    </li>
    <li>
    <p><i>MailService</i> attribute 	under the LocalJBossServerDomain MBean (in the 	conf/jboss-service.xml)</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="2">
    <li>
    <p><b>Cache Invalidation Service</b></p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>deploy/cache-invalidation-service.xml</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="3">
    <li>
    <p><b>J2EE Client Deployer Service</b></p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>deploy/client-deployer-service.xml</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="4">
    <li>
    <p><b>JBoss SNMP Agent</b></p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>lib/snmp-support.jar</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="5">
    <li>
    <p><b>Persistency of MBean 	Attributes</b></p>
    </li>
</ol>
<ul>
    <li value="1">
    <p><i>AttributePersistenceService</i> 	MBean (in the conf/jboss-service.xml)</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="6">
    <li>
    <p><b>CORBA/IIOP </b></p>
    </li>
</ol>
<ul>
    <li value="1">
    <p><i>CorbaORB</i> 	attribute under the LocalJBossServerDomain MBean (in the 	conf/jboss-service.xml)</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="7">
    <li>
    <p><b>Web-Console or JSR-77 	Extensions</b></p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>deploy/management 	directory</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="8">
    <li>
    <p><b>Console/Email Monitor Alerts</b></p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>deploy/monitoring-service.xml</p>
    </li>
    <li>
    <p>lib/jboss-monitoring.jar</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="9">
    <li>
    <p><b>EJB 2.1 Timer Service</b></p>
    </li>
</ol>
<ul>
    <li>
    <p>The EJB 2.1 TimerService is 	used to crate EJB Timer Beans. This will asynchronously launch beans 	at defined times.</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p>MBeans under the 'J2EE 	Timer Service' block in the deploy/ejb-deployer.xml</p>
    </li>
</ul>
<p>N<u>ote</u>: on linux machine (getafix) this service couldn't be removed 	(because it's used there), but could ne removed on windows and solaris 	(<i>terminator</i><span> machine)</span></p>
<p><br />
&nbsp;</p>
<ol start="10">
    <li>
    <p><b><font color="#000000">JBoss 	Scheduler Manager</font></b></p>
    </li>
</ol>
<ul>
    <li>
    <p>Allows scheduling invocations 	against MBeans.</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p>deploy/schedule-manager-service.xml</p>
    </li>
    <li>
    <p>deploy/scheduler-service.xml</p>
    </li>
    <li>
    <p>lib/scheduler-plugin* 	(scheduler-plugin.jar, scheduler-plugin-example.jar)</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="11">
    <li>
    <p><b>Hot Deployment</b></p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>Hot deployment of files 	into the deploy directory without restarting JBoss.</p>
    </li>
</ul>
<ul>
    <li>
    <p>in the <i>URLDeploymentScanner</i> 	mbean (under conf/jboss-service.xml), change the <font color="#984806"><i>ScanEnabled</i></font> 	attribute from 'true' to 'false'</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="12">
    <li>
    <p><b>BeanShell Deployer</b></p>
    </li>
</ol>
<ul>
    <li>
    <p>deploy/bsh-deployer.xml</p>
    </li>
    <li>
    <p>lib/bsh* (bsh-deployer.jar, 	bsh-1.3.0.jar)</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="13">
    <li>
    <p><b>JBoss UUID Key Generation</b></p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>Often used with CMP 	primary keys.</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p>deploy/uuid-key-generator.sar 	(wasn&rsquo;t found in the installation)</p>
    </li>
    <li>
    <p>lib/autonumber-plugin.jar</p>
    <p>&nbsp;</p>
    </li>
</ul>
<ol start="14">
    <li>
    <p><b>Deploy 	JMS Queues</b></p>
    </li>
</ol>
<ul>
    <li>
    <p>if it's removed on windows, 	then in the login process an exception is thrown. On the other hand, 	If it's removed on linux (getafix), then the login process doesn't 	throw exceptions.</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p><i>DestinationManager</i> 	attribute under the <i>LocalJBossServerDomain</i> MBean (in the 	conf/jboss-service.xml)</p>
    </li>
</ul>
<ol start="14">
    <p><u>Note</u>: on windows machine (yorammi), when this service was 	removed, an exception was thrown during the login process. <span>On 	linux machine (getafix), removing this service went OK, without 	exceptions.</span></p>
    <p>&nbsp;</p>
    <li>
    <p><b>RMI 	class-loading</b></p>
    </li>
</ol>
<ul>
    <li>
    <p>loading codebases from the client using classes on the server)</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p><font color="#000000">remove 	the </font>SystemPropertyClassValue and WebService Mbeans from 	conf/jboss-<font color="#000000">service.xml.</font></p>
    </li>
    <li>
    <p>Remove 	the following line:</p>
    <ul>
        <pre><font size="1">&lt;depends optional-attribute-name=&quot;WebServiceName&quot;&gt;jboss:service=WebService&lt;/depends&gt; </font></pre>
    </ul>
    <p>&nbsp;</p>
    </li>
</ul>
<ol start="16">
    <li>
    <p><b>JNDI-view</b></p>
    </li>
</ol>
<ul>
    <li>
    <p>shows the JNDI naming tree from the JMX console</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p>remove the JNDIView Mbean from conf/jboss-service.xml.</p>
    <p>&nbsp;</p>
    </li>
</ul>
<ol start="17">
    <li>
    <p><b>Apache-Tomcat 	connector</b></p>
    </li>
</ol>
<ul>
    <li>
    <p>It should be removed if users directly connect to Tomcat via HTTP 	and do not pass through Apache/mod_jk.</p>
    </li>
    <li>
    <p>Some of the clients use Apache and some aren't, so this connector 	should be removed only at clients that don't have Apache.</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p>open the deploy/jbossweb-tomcat55.sar/server.xml and remove the AJP 	1.3 Connector on port 8009</p>
    </li>
</ul>
<p><font color="#4f81bd"><font size="4"><i><b>Tuning Improvements</b></i></font></font></p>
<ol start="18">
    <li>
    <p><b>Use Pooled Invoker instead 	of JRMP</b></p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>By default, JBoss 	creates a new thread for every RMI request that comes in.</p>
    </li>
</ul>
<ul>
    <li>
    <p>Switch to pooled invoker 	instead of jrmp:</p>
    </li>
</ul>
<p>In conf/standardjboss.xml, replace all</p>
<p>&lt;invoker-mbean&gt;jboss:service=invoker,type=<font color="#984806">jrmp</font>&lt;/invoker-mbean&gt;</p>
<p>To</p>
<p>&lt;invoker-mbean&gt;jboss:service=invoker,type=<font color="#984806">pooled</font>&lt;/invoker-	mbean&gt;</p>
<p><br />
&nbsp;</p>
<ol start="19">
    <li>
    <p><b>Turn off the Connection 	Close Checking</b></p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>In production you don't 	need this check (assuming all connection leaks were found during 	development).</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p>In 	deploy/jbossjca-service.xml, change the <font color="#984806"><i>Debug</i></font> 	entry to false in the CachedConnectionManager service</p>
    <p>&nbsp;</p>
    </li>
</ul>
<ol start="20">
    <li>
    <p><b>Optional tunings that can 	be done</b></p>
    <ul>
        <p>1) 		Pre-compile JSPs &ndash; JSP pages in the UI can be pre-compiled<a href="http://tomcat.apache.org/tomcat-5.5-doc/jasper-howto.html#Web%20Application%20Compilation"><span>.</span></a></p>
        <p>2) 		Apache-Tomcat connector: when Apache is installed before Tomcat, it 		can be used to serve static content. According to Tomcat Wiki: 		<font color="#000000"><i>Historically, Apache has always been much 		faster than Tomcat at serving static content. The idea is to let 		Apache serve the static content when possible, then proxy the 		request back to Tomcat for Tomcat related content.</i></font></p>
    </ul>
    </li>
</ol>
<p><font color="#4f81bd"> <font size="4"><i><b>Services being used (so they can't be removed)</b></i></font></font></p>
<ol>
    <li>
    <p>JMX-Console</p>
    </li>
</ol>
<ul>
    <li>
    <p>deploy/jmx-console.war</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="2">
    <li>
    <p>Integrated HAR deployer and 	Hibernate session management services</p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>deploy/hibernate-deployer-service.xml 	(HAR support)</p>
    </li>
    <li>
    <p>lib/jboss-hibernate.jar (HAR 	support)</p>
    </li>
    <li>
    <p>lib/hibernate3.jar (Hibernate 	itself)</p>
    </li>
    <li>
    <p>lib/cglib.jar (used by 	Hibernate to create proxies of POJOs)</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="3">
    <li>
    <p>JBossSX</p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>JBossSX is the JBoss 	security framework which is used by the DB login module.</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p><i>SecurityConfig</i> 	MBean from conf/jboss-service.xml</p>
    </li>
</ul>
<p>&nbsp;</p>
<ol start="4">
    <li>
    <p>HTTPInvoker</p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>Tunnels RMI over HTTP</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p>deploy/http-invoker.sar 	directory</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="5">
    <li>
    <p>Vendor-Specific SQL Exception 	Handing</p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>deploy/sqlexception-service.xml</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="6">
    <li>
    <p>Loading properties using JMX</p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>JMX can load properties 	into the system properties via the Properties Service.</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p>deploy/properties-service.xml</p>
    </li>
    <li>
    <p>lib/properties-plugin.jar</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="7">
    <li>
    <p>Client-Side 	Transaction Management</p>
    </li>
</ol>
<ul>
    <li value="1">
    <p>If 	it's removed, then the SpringFactoryGC class can't be loaded:</p>
    <p><font size="1">java.lang.RuntimeException: 	org.springframework.beans.factory.BeanCreationException: Error 	creating bean with name 'transactionManager' defined in class path 	resource [applicationContext-j2ee.xml]: Initialization of bean 	failed; nested exception is 	org.springframework.transaction.TransactionSystemException: JTA 	UserTransaction is not available at JNDI location [UserTransaction]; 	nested exception is javax.naming.NameNotFoundException: 	UserTransaction not bound</font></p>
    </li>
</ul>
<ul>
    <li>
    <p><i>ClientUserTransactionService</i> 	MBean from conf/jboss-service.xml</p>
    </li>
    <li>
    <p>conf/xmdesc/ClientUserTransaction-xmbean.xml</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<ol start="8">
    <li>
    <p>Make JMX calls over RMI</p>
    </li>
</ol>
<ul>
    <li>
    <p>The shutdown.sh script uses 	this, so it can&rsquo;t be removed</p>
    </li>
</ul>
<ul>
    <li value="1">
    <p>deploy/jmx-invoker-adaptor-server.sar</p>
    </li>
    <li>
    <p>deploy/jmx-adaptor-plugin.jar</p>
    </li>
</ul>
<p><br />
&nbsp;</p>
<p><br />
&nbsp;</p>
<p><br />
&nbsp;</p>
<p><br />
&nbsp;</p>
<p><br />
&nbsp;</p>
<p><br />
&nbsp;</p>
<p><font color="#4f81bd"><font size="4"><i><b>Services that can be removed but don't exist in the application&rsquo; JBoss 4.0.5 deployment</b></i></font></font></p>
<ol>
    <li>
    <p>Distributed (clustered) web 	sessions</p>
    </li>
    <li>
    <p>Farm service (replicated 	deployments)</p>
    </li>
    <li>
    <p>EJB3</p>
    </li>
    <li>
    <p>XA data-sources (Distributed 	and/or recoverable transactions)</p>
    </li>
    <li>
    <p>web-console</p>
    </li>
    <li>
    <p>If you are using neither 	client-side transaction management nor cached connections</p>
    </li>
    <li>
    <p>J2EE client deployer service</p>
    </li>
    <li>
    <p>Clustering Service</p>
    </li>
</ol>
<div type="FOOTER">
<p align="center"><sdfield format="PAGE" subtype="RANDOM" type="PAGE">9</sdfield></p>
<p>&nbsp;</p>
</div>
<p>&nbsp;</p>
