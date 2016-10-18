
<div align="center">
Coming very soon!
</div>

<cfabort>

<cfparam name="sku" default="fa088">

<!--- <cfif NOT IsDefined("session.latitude")>

	<cfif operating_context IS 'dev'>
		<cfset #remote_ip# = '71.185.197.89'>
	</cfif> --->

	<cfquery name="ip_lookup" datasource="fatbraintoys" dbtype="#dbtype#">
	SELECT zipcode, city, state, latitude, longitude
	FROM (SELECT zipcode, city, region as state, ip_from, latitude, longitude
	FROM ip2location_zipcode_memory 
	WHERE ip_to >= INET_ATON('#remote_ip#')
	LIMIT 1) 
	AS mytable 
	WHERE ip_from <= INET_ATON('#remote_ip#')
	</cfquery>

	<cfoutput query="ip_lookup">
		<cfset #session.latitude# = #latitude#>
		<cfset #session.longitude# = #longitude#>
		<cfset #original_longitude# = #latitude#>
		<cfset #original_latitude# = #longitude#>
	</cfoutput>

<!--- </cfif> --->

<cfparam name="original_longitude" default="-96.238687">
<cfparam name="original_latitude" default="41.269413">

<cfset #target_date# = #dateformat(dateadd("h",-6,now()),"YYYY-MM-DD")#>
<cfset #rounded_target_date# = #createdatetime(year(target_date),month(target_date),day(target_date),hour(target_date),0,0)#>

<cfset #longitude_list# = #valuelist(get_orders.longitude)#>
<cfset #latitude_list# = #valuelist(get_orders.latitude)#>
<cfset #city_list# = #valuelist(get_orders.city)#>
<cfset #state_list# = #valuelist(get_orders.state)#>
<cfset #name_list# = #replacenocase(valuelist(get_orders.location_name),"'","","ALL")#>

<cfparam name="google_key" default="AIzaSyBPXmiA4PKS48rtMr7tJr8yzB_FjEOZXLQ">

  	<cfoutput><script type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=#google_key#&sensor=false"></script></cfoutput>

  	<style type="text/css">
      html, body, #map-canvas { height: 100%; margin: 0; }
    </style>
    <cfoutput>

    <script type="text/javascript">
    function initialize() {
      var map = new google.maps.Map(
        document.getElementById('map-canvas'), {
          center: new google.maps.LatLng(#original_latitude#, #original_longitude#),
          zoom: 10,
          mapTypeId: google.maps.MapTypeId.ROADMAP
      });

		//var image = '/img/brain.png';
		
		var image = {
			url: '/img/brain.png',
			//size: new google.maps.Size(85, 85),
			scaledSize: new google.maps.Size(50, 50)
			};
		
      	var marker = new google.maps.Marker({
            position: new google.maps.LatLng(#original_latitude#, #original_longitude#),
            map: map,
            icon: image
      });

       <cfloop index="i" from="1" to="#listlen(longitude_list)#">

		<cfset #target_longitude# = #listgetat(longitude_list,i)#>
		<cfset #target_latitude# = #listgetat(latitude_list,i)#>
		<cfset #target_store# = "#listgetat(name_list,i)#">
		<cfset #target_image# = "/img/Map-Marker-Ball-Left-Chartreuse-icon.png">
		
		<!---
		<img width="256" height="256" border="0" alt="Map-Marker-Ball-Azure-icon" src="/img/Map-Marker-Ball-Azure-icon.png">
		--->
		
		

		var contentString = '#target_store#';
		var infowindow = new google.maps.InfoWindow({
			  content: contentString
		  });
		  
		var image = {
			url: '#target_image#',
			size: new google.maps.Size(85, 85),
			scaledSize: new google.maps.Size(50, 50)
			};

		var marker = new google.maps.Marker({
            position: new google.maps.LatLng(#target_latitude#, #target_longitude#),
            map: map,
            icon: image,
            title: '#listgetat(city_list,i)#'
        });
        bindInfoWindow(marker, map, infowindow, '#target_store#',"#listgetat(city_list,i)# #listgetat(state_list,i)#");

	</cfloop>

    }

   function bindInfoWindow(marker, map, infowindow, html, Ltitle) {
    google.maps.event.addListener(marker, 'click', function() {
            infowindow.setContent(html);
            infowindow.open(map, marker);
    });

}
    google.maps.event.addDomListener(window, 'load', initialize);
    </script>

    </cfoutput>

  <div align="center">

    <div id="map-canvas" style="width: 740px; height: 400px"></div>

</div>




