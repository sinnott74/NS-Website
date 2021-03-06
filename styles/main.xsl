<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xalan="http://xml.apache.org/xalan" 
  xmlns:redirect="http://xml.apache.org/xalan/redirect"
  exclude-result-prefixes="str"
  extension-element-prefixes="redirect">

  <xsl:output method="html" indent="yes" omit-xml-declaration="yes" encoding="UTF-8" />

  <xsl:strip-space elements="*"/>
  
  <xsl:param name="data-dir" select="'data'" />
  <xsl:param name="web-dir" select="'web'"/>
   
  <xsl:import href="utils.xsl"/>

  <xsl:variable name="info-file" select="concat($data-dir,'/school_info.xml')"/>  
  <xsl:variable name="info-doc" select="document($info-file)"/>
  <xsl:variable name="info" select="$info-doc/SCHOOL_INFO"/>

  <xsl:variable name="news-file" select="concat($data-dir,'/school_news.xml')"/>  
  <xsl:variable name="news-doc" select="document($news-file)"/>
  <xsl:variable name="news-items" select="$news-doc/SCHOOL_NEWS/NEWS/NEWS-ITEM"/>
  <xsl:variable name="quick-news-items-allowed" select="$news-doc/SCHOOL_NEWS/NEWS/@quick-news-items"/>

  <xsl:variable name="history-file" select="concat($data-dir,'/school_history.xml')"/>  
  <xsl:variable name="history-doc" select="document($history-file)"/>
  <xsl:variable name="history" select="$history-doc/SCHOOL_HISTORY"/>
  
  <xsl:variable name="policies-file" select="concat($data-dir,'/school_policies.xml')"/>  
  <xsl:variable name="policies-doc" select="document($policies-file)"/>
  <xsl:variable name="policies" select="$policies-doc/SCHOOL_POLICIES"/>

  <xsl:variable name="calendar-file" select="concat($data-dir,'/school_calendar.xml')"/>  
  <xsl:variable name="calendar-doc" select="document($calendar-file)"/>
  <xsl:variable name="calendar" select="$calendar-doc/SCHOOL_CALENDARS"/>

  <xsl:variable name="members-file" select="concat($data-dir,'/school_members.xml')"/>  
  <xsl:variable name="members-doc" select="document($members-file)"/>
  <xsl:variable name="members" select="$members-doc/SCHOOL_MEMBERS"/>

  <xsl:variable name="properties" select="MAIN/PROPERTIES"/>
  <xsl:variable name="schoolprop" select="$info/SCHOOL"/>
  <xsl:variable name="school-name" select="$schoolprop/@name"/>
  <xsl:variable name="school-add1" select="$schoolprop/@address1"/>

  <xsl:template match="MAIN">
  	<xsl:call-template name="create-index-page"/>
  	<xsl:call-template name="create-news-page"/>
  	<xsl:call-template name="create-history-page"/>
  	<xsl:call-template name="create-staff-page"/>
  	<xsl:call-template name="create-policies-page"/>
  	<xsl:call-template name="create-calendar-page"/>
  </xsl:template>

  <xsl:template name="html-header">
      <xsl:comment>This page is generated from a build process</xsl:comment>
      <head>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <meta author="Greg Byrne - https://www.linkedin.com/in/greg-byrne-a4877340/"/>
      <title><xsl:value-of select="$school-name"/> - <xsl:value-of select="$school-add1"/></title>
      <link rel="shortcut icon" type="image/png" href="icons/favicon.png"/>
      
      <link href="css/ns.css" rel="stylesheet" type="text/css" />
      <link href="css/ns-mobile.css"  rel="stylesheet" type="text/css"/>
      <link href="https://fonts.googleapis.com/css?family=Stint+Ultra+Expanded" rel="stylesheet" type="text/css"/>
      <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"/>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
      <script src="js/ns.js"></script>
    </head>
  </xsl:template>

  <xsl:template name="create-index-page">
  	<html>
			<xsl:call-template name="html-header"/>
	  		<body>
				<xsl:call-template name="sidenav-bar"/>
				<div class="index-grid">
					<xsl:call-template name="navigation-bar"/>
					<xsl:call-template name="banner"/>
					<xsl:call-template name="quick-about"/>	
					<xsl:call-template name="quick-news"/>
					<xsl:call-template name="facebook-feed"/>
					<xsl:call-template name="contact"/>
					<xsl:call-template name="footer"/>
				</div>
  			</body>
		</html>
	</xsl:template>

	<xsl:template name="create-history-page">
  		<redirect:write file="{$web-dir}/history.html">
  			<html>
  				<xsl:call-template name="html-header"/>
  				<body>
	  				<xsl:call-template name="sidenav-bar"/>
  					<div class="other-page-grid">
  						<xsl:call-template name="navigation-bar"/>
  						<div id="content">
  							<div class="content-container">
  								<div class="content-item" id="history">
  									<h2 id="history-title">History</h2>
  									<p>
  										<xsl:call-template name="replace-newline-with-pagebreak">
											<xsl:with-param name="text" select="$history"/>
										</xsl:call-template>
									</p>
	  							</div>
  							</div>
  						</div>
  						<xsl:call-template name="footer"/>
  					</div>
  				</body>
  			</html>
  		</redirect:write>
  	</xsl:template>

  	<xsl:template name="create-news-page">
  		<redirect:write file="{$web-dir}/news.html">
  			<html>
  				<xsl:call-template name="html-header"/>
  				<body>
	  				<xsl:call-template name="sidenav-bar"/>
  					<div class="other-page-grid">
  						<xsl:call-template name="navigation-bar"/>
  						<div id="content">
  							<div class="content-container">
  								<div class="content-item" id="news">
  									<h2 id="news-title">News</h2>
  									<div id="news-container">
  										<xsl:call-template name="news-items"/>
  									</div>
	  							</div>
  							</div>
  						</div>
  						<xsl:call-template name="footer"/>
  					</div>
  				</body>
  			</html>
  		</redirect:write>
  	</xsl:template>

  	<xsl:template name="create-staff-page">
  		<redirect:write file="{$web-dir}/staff.html">
  			<html>
  				<xsl:call-template name="html-header"/>
  				<body>
	  				<xsl:call-template name="sidenav-bar"/>
  					<div class="other-page-grid">
  						<xsl:call-template name="navigation-bar"/>
  						<div id="content">
  							<div class="content-container">
  								<div class="content-item" id="staff">
  									<h2 id="staff-title">Staff</h2>
  									<div class="custom-table-container">
  										<table class="custom-table" id="staff-member-table">
	  										<thead>
  												<tr>
  													<td>Staff Member</td>
  													<td>Role(s)</td>
  												</tr>
  											</thead>
  											<tbody>
  												<xsl:for-each select="$members/STAFF/MEMBER">
  													<tr>
  														<td><xsl:value-of select="@name"/></td>
	  													<td>	
  															<xsl:value-of select="ROLE"/>
  															<xsl:if test="ROLE != '' and ROLE/TEACHER">
  																<xsl:text>, </xsl:text>
	  														</xsl:if>
  															<xsl:if test="ROLE/TEACHER">
  																<xsl:text>Teacher (</xsl:text>
  																<xsl:value-of select="ROLE/TEACHER/@class"/>
  																<xsl:text> class)</xsl:text>
  															</xsl:if>
  														</td>
  													</tr>
  												</xsl:for-each>
  											</tbody>
  										</table>
  									</div>
  									<h2 id="bom-title">Board of Management</h2>
  									<div class="custom-table-container">
	  									<table class="custom-table" id="bom-member-table">
  											<thead>
  												<tr>
  													<td>B.O.M. Member</td>
  													<td>Role(s)</td>
  												</tr>
  											</thead>
  											<tbody>
  												<xsl:for-each select="$members/BOM/MEMBER">
  													<tr>
  														<td><xsl:value-of select="@name"/></td>
	  													<td>	
  															<xsl:for-each select="ROLE">
	  															<xsl:value-of select="."/>
  																<xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
  															</xsl:for-each>
  														</td>
  													</tr>
  												</xsl:for-each>
  											</tbody>
  										</table>
  									</div>
	  							</div>
  							</div>
  						</div>
  						<xsl:call-template name="footer"/>
  					</div>
  				</body>
  			</html>
  		</redirect:write>
  	</xsl:template>

  	<xsl:template name="create-policies-page">
  		<redirect:write file="{$web-dir}/policies.html">
  			<html>
  				<xsl:call-template name="html-header"/>
  				<body>
	  				<xsl:call-template name="sidenav-bar"/>
  					<div class="other-page-grid">
  						<xsl:call-template name="navigation-bar"/>
  						<div id="content">
  							<div class="content-container">
  								<div class="content-item" id="policies">
  									<h2 id="policies-title">Policies</h2>
  									<xsl:for-each select="$policies/POLICY">
  										<xsl:variable name="policy-file-name" select="@name"/>
  										<xsl:variable name="policy-file" select="@relativeFileLocation"/>
  										<button class="accordion"><xsl:value-of select="@name"/></button>
										<div class="panel">
											<xsl:if test="./text()">
												<span class="panel-item">
													<xsl:call-template name="replace-newline-with-pagebreak">
														<xsl:with-param name="text" select="./text()"/>
													</xsl:call-template>
												</span>
											</xsl:if>
  											<xsl:if test="@relativeFileLocation">
  												<span class="panel-item">
  													<a href="./{$policy-file}">View</a>
  												</span>
  												<span class="panel-item">
  													<a href="./{$policy-file}" download="{$policy-file-name}">Download</a>
												</span>
  											</xsl:if>
										</div>
  									</xsl:for-each>
	  							</div>
  							</div>
  						</div>
  						<xsl:call-template name="footer"/>
  					</div>
  				</body>
  			</html>
  		</redirect:write>
  	</xsl:template>

  	<xsl:template name="create-calendar-page">
  		<redirect:write file="{$web-dir}/calendar.html">
  			<html>
  				<xsl:call-template name="html-header"/>
  				<body>
	  				<xsl:call-template name="sidenav-bar"/>
  					<div class="other-page-grid">
  						<xsl:call-template name="navigation-bar"/>
  						<div id="content">
  							<div class="content-container">
  								<div class="content-item" id="calendar">
  									<h2 id="calendar-title"><xsl:text>Calendar </xsl:text><xsl:value-of select="$schoolprop/CALENDAR/@years"/></h2>
  									<table class="custom-table" id="calendar-table">
  										<tbody>
  											<xsl:for-each select="$calendar/CALENDAR/CALENDARITEM">
  												<tr>
  													<td><xsl:value-of select="@event"/></td>
	  												<td>
	  													<xsl:call-template name="replace-newline-with-pagebreak">
															<xsl:with-param name="text" select="./text()"/>
														</xsl:call-template>
													</td>
  												</tr>
  											</xsl:for-each>
  										</tbody>
  									</table>
  								</div>
  							</div>
  						</div>
  						<xsl:call-template name="footer"/>
  					</div>
  				</body>
  			</html>
  		</redirect:write>
  	</xsl:template>

  	<xsl:template name="sidenav-bar">
      <!-- Scrim div used to allow click anywhere close -->
      <div class="scrim" onclick="closeNav()" style="opacity: 0; pointer-events: none;"></div>
  		<div id="sidenav" class="sidenav" onclick="closeNav()">
			<a href="index.html">Home</a>
			<a href="news.html">News</a>
			<a href="staff.html">Staff &amp; B.O.M</a>
			<a href="policies.html">Policies</a>
			<a href="calendar.html">Calendar</a>
			<a href="history.html">History</a>
			<a href="index.html#contact">Contact</a>
		</div>
  	</xsl:template>

	<xsl:template name="banner">
  		<div id="banner">
			<div id="parent-text-container">
				<div class="banner-text-overlay">
					<h1><xsl:value-of select="$school-name"/></h1>
					<h2><xsl:value-of select="$school-add1"/>, <xsl:value-of select="$schoolprop/@address2"/>, <xsl:value-of select="$schoolprop/@address3"/></h2>
				</div>
			</div>
			<div id="school-image" class="banner-parallax"/>
		</div>
  	</xsl:template>

  	<xsl:template name="quick-about">
  		<div id="quick-about" class="grid-item-padding">
			<div id="quick-about-bg" class="quick-about-parallax">
				<div class="bubble-container">
  					<div class="single-bubble-container">
    					<div class="bubble-title">Students</div>
						<div class="bubble" id="bubble-student">
							<span class="count"><xsl:value-of select="$schoolprop/@pupilCount"/></span>
      					</div>
        			</div>
    				<div class="single-bubble-container">
    					<div class="bubble-title">Teachers</div>
						<div class="bubble" id="bubble-teacher">
							<span class="count"><xsl:value-of select="$schoolprop/@teacherCount"/></span>
        				</div>
        			</div>
        			<div class="single-bubble-container">
    					<div class="bubble-title">Special Education Teacher</div>
						<div class="bubble" id="bubble-sna">
							<span class="count"><xsl:value-of select="$schoolprop/@sntCount"/></span>
        				</div>
        			</div>
        		</div>
        	</div>
		</div>	
  	</xsl:template>

  	<xsl:template name="quick-news">
  		<div id="quick-news" class="grid-item-padding">
			<div id="quick-news-title">
				<h2>School News</h2>
			</div>
			<div id="quick-news-container">
				<xsl:call-template name="news-items">
					<xsl:with-param name="news-items-allowed" select="$quick-news-items-allowed"/>
				</xsl:call-template>
			</div>
			<button id="more-news-redirect-button" onclick="location.href='news.html';">More News</button>
		</div>
  	</xsl:template>

  	<xsl:template name="news-items">
  		<xsl:param name="news-items-allowed" select="100"/>
  		<xsl:for-each select="$news-items">
			<xsl:sort select="@yyyyMMdd" order="descending"/>
			<xsl:sort select="@time" order="descending"/>
			<xsl:if test="position() &lt; ($news-items-allowed+1)">
				<div class="news-item">
					<div class="news-item-date">
						<xsl:call-template name="format-datetime-for-display">
							<xsl:with-param name="yyyyMMdd" select="@yyyyMMdd"/>
							<xsl:with-param name="time" select="@time"/>
						</xsl:call-template>
					</div>
					<div class="news-item-title"><xsl:value-of select="title/text()"/></div>
					<div class="news-item-text-content">
						<xsl:variable name="news-item-text">
							<xsl:call-template name="replace-newline-with-pagebreak">
								<xsl:with-param name="text" select="content/text()"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:value-of select="$news-item-text" disable-output-escaping="yes"/>
					</div> 
				</div>
			</xsl:if>
		</xsl:for-each>
  	</xsl:template>

  	<xsl:template name="facebook-feed">
  		<div id="fb" class="grid-item-padding">
			<div id="fb-container">
				<xsl:variable name="facebook-feed-link" select="$properties/FACEBOOK/@feedLink"/>
				<iframe id="fb-feed" src="{$facebook-feed-link}" width="340" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"/>
			</div>
		</div>
  	</xsl:template>

  	<xsl:template name="contact">
  		<div id="contact" class="grid-item-padding">
			<div id="contact-title">
				<h2>Contact Us</h2>
			</div>
			<div id="contact-container">
				<div id="contact-phone" class="contact-item">
					<img src="icons/phone-24.ico" alt="Phone" class="contact-item-icon"/>
					<xsl:variable name="school-contact-num" select="$schoolprop/@contactNumber"/>
					<a href="tel:{$school-contact-num}"><xsl:value-of select="$school-contact-num"/></a>
				</div>
				<div id="contact-email" class="contact-item">
					<img src="icons/email-24.ico" alt="Email" class="contact-item-icon"/>
					<xsl:variable name="school-contact-email" select="$schoolprop/@contactEmail"/>
					<a href="mailto:{$school-contact-email}"><xsl:value-of select="$school-contact-email"/></a>
				</div>
				<div id="contact-facebook" class="contact-item">
					<img src="icons/facebook-24.ico" alt="Facebook" class="contact-item-icon"/>
					<xsl:variable name="fb-link" select="$properties/FACEBOOK/@link"/>
      				<a href="{$fb-link}"><xsl:value-of select="$school-name"/></a>
				</div>
			</div>
      		<xsl:variable name="google-map-link" select="$properties/GOOGLE/@mapLink"/>
      		<iframe id="gmap" src="{$google-map-link}" frameborder="0" allowfullscreen=""/>
      	</div>
  	</xsl:template>

  	<xsl:template name="navigation-bar">
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
  	</xsl:template>

  	<xsl:template name="footer">
  		<div id="footer" class="grid-item-padding">
			<div id="footer-text">
				Copyright © <xsl:value-of select="$properties/COPYRIGHT/@years"/>. <xsl:value-of select="$school-name"/>, <xsl:value-of select="$school-add1"/>. All Rights Reversed.
			</div>
			<button id="footer-button" onclick="topFunction()">Back to Top</button>
		</div>
  	</xsl:template>

</xsl:stylesheet>