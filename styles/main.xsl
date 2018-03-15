<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  
  xmlns:xalan="http://xml.apache.org/xalan" xmlns:redirect="http://xml.apache.org/xalan/redirect"
  extension-element-prefixes="redirect">

  <xsl:param name="input-dir" select="''" />
  <xsl:param name="output-dir-html" select="''" />

  <xsl:output method="html" indent="yes" omit-xml-declaration="yes"
    encoding="UTF-8" />

  <xsl:template match="MAIN">
  	<xsl:call-template name="create-index"/>
  </xsl:template>

  <xsl:template name="create-index">

  	<html>
	<head>
		<meta charset="UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<meta author="Greg Byrne - https://www.linkedin.com/in/greg-byrne-a4877340/"/>
	    <title>National School - Location</title>
		<link type="text/css" rel="stylesheet" href="ns.css"/>
		<script src="ns.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	</head>
	<body>
		<!-- 
<div id="fb-root"></div>
			<script>(function(d, s, id) {
			  var js, fjs = d.getElementsByTagName(s)[0];
 				 if (d.getElementById(id)) return;
 				 js = d.createElement(s); js.id = id;
  				js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12';
 				 fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));</script>
 -->
		<div id="sidenav" class="sidenav" onclick="closeNav()">
 	 		<!-- <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"/> -->
		  	<a href="#quick-about">About</a>
		  	<a href="#news">News</a>
		  	<a href="#staff">Staff</a>
		  	<a href="#policies">Policies</a>
		  	<a href="#history">History</a>
		  	<a href="#contact">Contact</a>
		</div>
		<div class="grid content">
		<div id="navigation" onclick="openNav()">
			<div id="sidenav-toggle">
				<div id="bar1" class="bar"></div>
				<div id="bar2" class="bar"></div>
				<div id="bar3" class="bar"></div>
			</div>
			<div id="navigation-text">
				<xsl:value-of select="PROPERTIES/SCHOOL/@name"/>, Location
			</div>
		  	<!-- <button onclick="openNav()">open</button> -->
		</div> 	 
		<div id="banner">
			<div id="parent-text-container">
				<div id="banner-vid-text-overlay">
					<h1>National School</h1>
					<h2>Location</h2>
				</div>
			</div>
			<video autoplay="autoplay" muted="muted" loop="loop" id="vid">
			  <source src="school.mp4" type="video/mp4"/>
			  Your browser does not support the video tag.
			</video>
		</div>
		<div id="quick-about" class="grid-item-padding">
			<div class="bubble-container">
  				<div class="single-bubble-container">
    				<div class="bubble-title">Students</div>
					<div class="bubble" id="bubble-student">
						<span class="count">120</span>
      				</div>
        		</div>
    			<div class="single-bubble-container">
    				<div class="bubble-title">Teachers</div>
					<div class="bubble" id="bubble-teacher">
						<span class="count">6</span>
        			</div>
        		</div>
        		<div class="single-bubble-container">
    				<div class="bubble-title">Special-Needs Assistants</div>
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
		</div>		
		<div id="news" class="grid-item-padding">Latest News</div>
		<div id="fb" class="grid-item-padding">
<!-- 			<div class="fb-page" data-href="https://www.facebook.com/cortownns" data-tabs="timeline, events" data-width="500" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="false"><blockquote cite="https://www.facebook.com/cortownns" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/cortownns">St. Brigid&#039;s NS, Cortown</a></blockquote></div> -->
			<div id="fb-container">
				<xsl:variable name="facebook-feed-link" select="PROPERTIES/FACEBOOK/@feedlink"/>
				<iframe src="{$facebook-feed-link}" width="340" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"/>
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
			<table>
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
							<a href="tel:555555555">087xxxxxxx></a>
      					</td>
      				</tr>
      				<tr>
      					<td class="email-text">
      						 Email:
      					</td>
      					<td class="contact-value">
							<a href="mailto:email@email.com">email@email.com</a>
      					</td>
      				</tr>
      				<tr>
      					<td class="fb-text">
      						 Facebook:
      					</td>
      					<td class="fb-value">
      						<a href="https://www.facebook.com">Link</a>
      					</td>
      				</tr>
      			</tbody>
      		</table>
      		<xsl:variable name="google-map-link" select="PROPERTIES/GOOGLE/@maplink"/>
      		<iframe src="{$google-map-link}" width="100%" height="375" frameborder="0" style="border:0" allowfullscreen=""/>
      	</div>
		<div id="footer" class="grid-item-padding">Copyright © 2018. National School, Location. All Rights Reversed.</div>
	</div>
  </body>
</html>
  </xsl:template>

</xsl:stylesheet>