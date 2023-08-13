function initMap() {
    const map = new google.maps.Map(document.getElementById('map'), {
      center: { lat: 0, lng: 0 },
      zoom: 8
    });
  
    fetch('/properties')
      .then(response => response.json())
      .then(properties => {
        properties.forEach(property => {
          const marker = new google.maps.Marker({
            position: { lat: property.latitude, lng: property.longitude },
            map,
            title: property.address
          });
          const content = `
            <h3>${property.address}</h3>
            <p><b>Current Owner:</b> ${property.current_owner}</p>
            <p><b>Previous Owners:</b> ${property.previous_owners.join(', ')}</p>
            <p><b>Cost:</b> $${property.cost}</p>`;
          const infowindow = new google.maps.InfoWindow({
            content: content
          });
          marker.addListener('click', () => {
            infowindow.open(map, marker);
          });
        });
      });
  }
  
  function loadMap() {
    const script = document.createElement('script');
    script.src = `https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY&callback=initMap`;
    script.defer = true;
    script.async = true;
    document.head.appendChild(script);
  }
  
  window.addEventListener('load', loadMap);
  