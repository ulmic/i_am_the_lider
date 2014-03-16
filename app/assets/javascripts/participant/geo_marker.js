var map;
var marker;
var click_flag = 0;
var my_center = new google.maps.LatLng(54.2863343, 48.3477731);

function init_my_center(latitude, longitude) {
  my_center = new google.maps.LatLng(latitude, longitude);
  var mapProp = {
    center: my_center,
    zoom: 10,
    mapTypeControl: true,
    sensor: true,
    mapTypeControlOptions: {
      style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
  google.maps.event.addListener(map, 'click', function(event) {
    place_marker(event.latLng);
  });
  marker = new google.maps.Marker({
    position: "(" + latitude + ", " + longitude + ")",
    animation: google.maps.Animation.BOUNCE,
    map: map,
  });
}

function initialize() {
  var mapProp = {
    center: my_center,
    zoom: 10,
    mapTypeControl: true,
    sensor: true,
    mapTypeControlOptions: {
      style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
  google.maps.event.addListener(map, 'click', function(event) {
    place_marker(event.latLng);
  });

}

function place_marker(location) {
  if (click_flag === 0) {
    marker = new google.maps.Marker({
      position: location,
      animation: google.maps.Animation.BOUNCE,
      map: map,
    });
    click_flag = 1;
  } else {
    marker.setPosition(location);
    map.panTo(location);
  }
  input_value = String(location).replace(/[()]/g, '');
  document.getElementById("input_map").value = input_value;
}
google.maps.event.addDomListener(window, 'load', initialize);
