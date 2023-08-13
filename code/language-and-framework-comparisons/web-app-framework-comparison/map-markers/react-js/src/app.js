import React, { Component } from 'react';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      markers: [],
      currentMarker: null
    };
  }

  componentDidMount() {
    this.loadGoogleMapsScript();
  }

  loadGoogleMapsScript() {
    const script = document.createElement('script');
    script.src = `https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY&libraries=places`;
    script.onload = () => this.initMap();
    document.head.appendChild(script);
  }

  initMap() {
    const map = new window.google.maps.Map(document.getElementById('map'), {
      center: { lat: 37.7749, lng: -122.4194 }, // San Francisco coordinates
      zoom: 10
    });

    map.addListener('click', event => {
      this.addMarker(event.latLng);
    });
  }

  addMarker(location) {
    const marker = new window.google.maps.Marker({
      position: location,
      map: this.map,
      draggable: true
    });

    marker.addListener('dragend', () => {
      this.updateMarker(marker);
    });

    this.setState(prevState => ({
      markers: [...prevState.markers, marker]
    }));
  }

  updateMarker(marker) {
    // Implement your marker update logic here (e.g., saving to a backend)
  }

  render() {
    return (
      <div className="App">
        <h1>Geo-Location Markers App</h1>
        <div id="map" className="Map"></div>
      </div>
    );
  }
}

export default App;
