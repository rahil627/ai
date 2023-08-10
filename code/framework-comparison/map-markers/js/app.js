var map;
var markers = [];

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: 37.7749, lng: -122.4194 }, // San Francisco coordinates
    zoom: 10
  });

  map.addListener('click', function(event) {
    addMarker(event.latLng);
  });
}

function addMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map,
    draggable: true
  });

  marker.addListener('dragend', function() {
    updateMarker(marker);
  });

  markers.push(marker);
}

function updateMarker(marker) {
  // Implement your marker update logic here (e.g., sending data to the API)
}
