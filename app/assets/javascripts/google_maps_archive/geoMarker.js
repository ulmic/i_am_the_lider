/* Script for Google maps geo Marker */
var geolocationID = 15;
var map;
var marker;
var clickFlag = 0;
var myCenter=new google.maps.LatLng(39.436192999314095, -101.77734375);
function initialize()
{
var mapProp = {
  center:myCenter,
  zoom:4,
  mapTypeControl:true,
   sensor:true,
    mapTypeControlOptions: {
      style:google.maps.MapTypeControlStyle.DROPDOWN_MENU
    },
  mapTypeId:google.maps.MapTypeId.ROADMAP
};
  map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
  });
}
function placeMarker(location) {
if(clickFlag == 0) {
  marker = new google.maps.Marker({
    position: location,
	animation:google.maps.Animation.BOUNCE,
    map: map,
  });
  //var infowindow = new google.maps.InfoWindow({
  //  Content: ''+ location
  //});
	//infowindow.open(map,marker);
	clickFlag = 1;
}
else {
	marker.setPosition( location);
	map.panTo(location);
}
//this ID of the hidden field should be common.
document.getElementById("input_"+geolocationID).value = location;
//alert(document.getElementById("mapLatLang").value);
}
google.maps.event.addDomListener(window, 'load', initialize);