var map;
var marker;
var clickFlag = 0;
var myCenter = new google.maps.LatLng(54.2863343, 48.3477731);

function initMyCenter(latitude, longitude) {
  myCenter = new google.maps.LatLng(latitude, longitude);
}
function initialize()
{
  var mapProp = {
    center:myCenter,
    zoom:10,
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
    clickFlag = 1;
  }
  else {
    marker.setPosition( location);
    map.panTo(location);
  }
  input_value = String(location).replace(/[()]/g, '');
  document.getElementById("input_map").value = input_value;
}
google.maps.event.addDomListener(window, 'load', initialize);
