<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xalan="http://xml.apache.org/xalan" 
  xmlns:redirect="http://xml.apache.org/xalan/redirect"
  exclude-result-prefixes="str"
  extension-element-prefixes="redirect">

  <xsl:output method="html" indent="yes" omit-xml-declaration="yes" encoding="UTF-8" />
  
  <xsl:param name="data-dir" select="''" />
    
  <xsl:variable name="spacechar" select="'&#10;'"/>

  <xsl:variable name="news-file" select="concat($data-dir,'/news.xml')"/>  
  <xsl:variable name="news-doc" select="document($news-file)"/>
  <xsl:variable name="news-items" select="$news-doc/MAIN/NEWS/NEWS-ITEM"/>
  <xsl:variable name="school-name" select="MAIN/PROPERTIES/SCHOOL/@name"/>
  <xsl:variable name="school-add1" select="MAIN/PROPERTIES/SCHOOL/@address1"/>
  <xsl:variable name="quick-news-items-allowed" select="4"/>

  <xsl:template match="MAIN">
  	<xsl:call-template name="create-index"/>
  </xsl:template>

  <xsl:template name="create-index">

  	<html>
	<head>
		<meta charset="UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<meta author="Greg Byrne - https://www.linkedin.com/in/greg-byrne-a4877340/"/>
	    <title><xsl:value-of select="$school-name"/> - <xsl:value-of select="$school-add1"/></title>
		<link type="text/css" rel="stylesheet" href="ns.css"/>
		<script src="ns.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id="sidenav" class="sidenav" onclick="closeNav()">
		  	<a href="#quick-about">About</a>
		  	<a href="#quick-news">News</a>
		  	<a href="#staff">Staff &amp; B.O.M</a>
		  	<a href="#policies">Policies</a>
		  	<a href="#history">Calendar</a>
		  	<a href="#history">History</a>
		  	<a href="#contact">Contact</a>
		</div>
		<div class="grid">
		<div id="navigation" onclick="openNav()">
			<div id="sidenav-toggle">
				<div id="bar1" class="bar"></div>
				<div id="bar2" class="bar"></div>
				<div id="bar3" class="bar"></div>
			</div>
			<div id="navigation-text">
				<xsl:value-of select="$school-name"/>, <xsl:value-of select="$school-add1"/>
			</div>
		</div> 	 
		<div id="banner">
			<div id="parent-text-container">
				<div class="banner-text-overlay">
					<h1><xsl:value-of select="$school-name"/></h1>
					<h2><xsl:value-of select="$school-add1"/></h2>
				</div>
				<script>
					// Have the banner text fade on scroll
$(window).scroll(function(){
    $(".banner-text-overlay").css("opacity", 1 - $(window).scrollTop() / 550);
 });
// Have the banner text stay in position on scroll
$(window).scroll(function(){
    $(".banner-text-overlay").css("top", $(window).scrollTop() + 12);
 });  
</script>
			</div>
			<!-- Video -->
			<!-- <video autoplay="autoplay" muted="muted" loop="loop" id="vid">
			  <source src="school.mp4" type="video/mp4"/>
			  Your browser does not support the video tag.
			</video> -->
			<!-- Parallax Scroll Image -->
			<div id="school-image" class="parallax"/>
		</div>
		<div id="quick-about" class="grid-item-padding">
			<div class="bubble-container">
  				<div class="single-bubble-container">
    				<div class="bubble-title">Students</div>
					<div class="bubble" id="bubble-student">
						<span class="count">115</span>
      				</div>
        		</div>
    			<div class="single-bubble-container">
    				<div class="bubble-title">Teachers</div>
					<div class="bubble" id="bubble-teacher">
						<span class="count">5</span>
        			</div>
        		</div>
        		<div class="single-bubble-container">
    				<div class="bubble-title">Special Education Teacher</div>
					<div class="bubble" id="bubble-sna">
						<span class="count">1</span>
        			</div>
        		</div>
        	</div>
			<script>
	$('.count').each(function () {
    	$(this).prop('Counter',0).animate({
        	Counter: $(this).text()
    	}, {
        	duration: 6000,
        	easing: 'swing',
        	step: function (now) {
            	$(this).text(Math.ceil(now));
        	}
    	});
	});
	</script>
			<!-- <div id="external-ref">
        		<a href="https://www.education.ie/en/find-a-school/School-Detail/?roll=17162U">DOE Information</a>
        	</div> -->
		</div>		
		<div id="quick-news" class="grid-item-padding">
			<div id="quick-news-container">
				<xsl:for-each select="$news-items">
					<xsl:sort select="@year" order="descending"/>
					<xsl:sort select="@month" order="descending"/>
					<xsl:sort select="@day" order="descending"/>
					<xsl:if test="position() &lt; ($quick-news-items-allowed+1)">
					<div class="news-item">
						<div class="news-item-date"><xsl:value-of select="concat(@day,'/',@month,'/',@year, ' ',@time)"/></div>
						<div class="news-item-title"><xsl:value-of select="@title"/></div>
						<div class="news-item-text-content">
							<xsl:variable name="news-item-text">
								<xsl:call-template name="string-replace-all">
									<xsl:with-param name="text" select="./text()"/>
             				    	<xsl:with-param name="replace" select="$spacechar"/>
                					<xsl:with-param name="by"><xsl:text>&lt;br/&gt;</xsl:text></xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:value-of select="$news-item-text" disable-output-escaping="yes"/>
						</div> 
					</div>
					<hr/>
					</xsl:if>
				</xsl:for-each>
			</div>
			<button id="more-news-redirect-button">More News</button>
		</div>
		<div id="fb" class="grid-item-padding">
			<div id="fb-container">
				<xsl:variable name="facebook-feed-link" select="PROPERTIES/FACEBOOK/@feedLink"/>
				<iframe id="fb-feed" src="{$facebook-feed-link}" width="340" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"/>
			</div>
		</div>
		<div id="staff" class="grid-item-padding">
			<table>
				<colgroup>
					<col width="30%"/>
					<col width="70%"/>
				</colgroup>
				<thead>
					<tr>
						<td colspan="2">
							Staff
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							Mrs. Principal
						</td>
						<td>
							Principal
						</td>
					</tr>
					<tr>
						<td>
							Mr. Teacher
						</td>
						<td>
							Teacher
						</td>
					</tr>
					<tr>
						<td>
							Ms. Teacher
						</td>
						<td>
							Teacher
						</td>
					</tr>
					<tr>
						<td>
							Mr. Caretaker
						</td>
						<td>
							Cartaker
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="policies" class="grid-item-padding">Policies</div>
		<div id="history" class="grid-item-padding">
			History
		</div>
		<div id="contact" class="grid-item-padding">
			<table id="contact-details-table">
      			<colgroup>
      				<col width="40%"/>
      				<col width="60%"/>
      			</colgroup>
      			<thead>
      				<tr> 
      					<td colspan="2">
      						Contact
      					</td>
      				</tr>
      			</thead>
      			<tbody>
      				<tr>
      					<td class="phone-text">
      					   Phone:
      					</td>
      					<td class="contact-value">
      						<xsl:variable name="school-contact-num" select="PROPERTIES/SCHOOL/@contactNumber"/>
							<a href="tel:{$school-contact-num}"><xsl:value-of select="$school-contact-num"/></a>
      					</td>
      				</tr>
      				<tr>
      					<td class="email-text">
      						 Email:
      					</td>
      					<td class="contact-value">
      						<xsl:variable name="school-contact-email" select="PROPERTIES/SCHOOL/@contactEmail"/>
							<a href="mailto:{$school-contact-email}"><xsl:value-of select="$school-contact-email"/></a>
      					</td>
      				</tr>
      				<tr>
      					<td class="fb-text">
      						 Facebook:
      					</td>
      					<td class="fb-value">
      						<xsl:variable name="fb-link" select="PROPERTIES/FACEBOOK/@link"/>
      						<a href="{$fb-link}"><xsl:value-of select="$school-name"/></a>
      					</td>
      				</tr>
      			</tbody>
      		</table>
      		<xsl:variable name="google-map-link" select="PROPERTIES/GOOGLE/@mapLink"/>
      		<iframe id="gmap" src="{$google-map-link}" frameborder="0" allowfullscreen=""/>
      	</div>
		<div id="footer" class="grid-item-padding">
			<div id="footer-text">
				Copyright © <xsl:value-of select="PROPERTIES/COPYRIGHT/@years"/>. <xsl:value-of select="$school-name"/>, <xsl:value-of select="$school-add1"/>. All Rights Reversed.
			</div>
			<button id="footer-button" onclick="topFunction()">Back to Top</button>
		</div>
	</div>
  </body>
</html>
  </xsl:template>

<!-- TODO: move to a utils xsl import -->
  <xsl:template name="string-replace-all">
   <xsl:param name="text"/>
   <xsl:param name="replace"/>
   <xsl:param name="by"/>
   <xsl:choose>
     <xsl:when test="contains($text,$replace)">
       <xsl:value-of select="substring-before($text,$replace)"/>
       <xsl:value-of select="$by" disable-output-escaping="yes"/>
       <xsl:call-template name="string-replace-all">
         <xsl:with-param name="text" select="substring-after($text,$replace)"/>
         <xsl:with-param name="replace" select="$replace"/>
         <xsl:with-param name="by" select="$by"/>
       </xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
       <xsl:value-of select="$text"/>
     </xsl:otherwise>
   </xsl:choose>
</xsl:template>

</xsl:stylesheet>