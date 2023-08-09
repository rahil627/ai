var map;
var markers = [];

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: 37.7749, lng: -122.4194 }, // San Francisco coordinates
    zoom: 10
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

function updateMarker(marker) {
  var id = markers.indexOf(marker) + 1;
  var position = marker.getPosition();
  fetch(`/api/markers/${id}`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ lat: position.lat(), lng: position.lng() })
  });
}
