function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
      center: { lat: 37.7749, lng: -122.4194 }, // San Francisco coordinates
      zoom: 10
    });
  
    // Fetch markers from API and add them to the map
    fetch('/api/markers')
      .then(response => response.json())
      .then(data => {
        data.forEach(marker => {
          var markerPosition = { lat: marker.lat, lng: marker.lng };
          new google.maps.Marker({
            position: markerPosition,
            map: map,
            draggable: true
          });
        });
      });
  }
  