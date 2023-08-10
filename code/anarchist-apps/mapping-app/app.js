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

  fetch('/api/markers')
    .then(response => response.json())
    .then(data => {
      data.forEach(marker => {
        var markerPosition = { lat: marker.lat, lng: marker.lng };
        var marker = new google.maps.Marker({
          position: markerPosition,
          map: map,
          draggable: true
        });

        marker.addListener('dragend', () => {
          updateMarker(marker);
        });

        markers.push(marker);
      });
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

  var xhr = new XMLHttpRequest();
  xhr.open('POST', '/api/markers', true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.send(JSON.stringify({ lat: marker.getPosition().lat(), lng: marker.getPosition().lng() }));
}

function updateMarker(marker) {
  var id = markers.indexOf(marker) + 1;
  var position = marker.getPosition();
  var xhr = new XMLHttpRequest();
  xhr.open('PUT', `/api/markers/${id}`, true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.send(JSON.stringify({ lat: position.lat(), lng: position.lng() }));
}
