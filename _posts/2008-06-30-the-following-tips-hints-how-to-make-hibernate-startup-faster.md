---
layout: default
title: The following tips hints how to make Hibernate startup faster.
created: 1214855580
---
<p><span class="thmr_call" id="thmr_42"><span class="thmr_call" id="thmr_6"><p>When building the configuration 40-60% of the time is used by the XML parsers and Dom4j to read up the XML document. Significant performance increases can be done by serializing the Document object's to disc once, and afterwards just add them to the configuration by deserializing them first.</p></span></span></p>
