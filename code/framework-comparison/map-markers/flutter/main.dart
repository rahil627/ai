import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MarkerInfo {
  final LatLng latLng;
  MarkerInfo(this.latLng);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geo-Location Markers App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  List<MarkerInfo> markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geo-Location Markers Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: Set.from(markers.map((marker) {
          return Marker(
            markerId: MarkerId(marker.latLng.toString()),
            position: marker.latLng,
            draggable: true,
            onDragEnd: (newPosition) {
              _updateMarker(marker, newPosition);
            },
          );
        })),
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // San Francisco coordinates
          zoom: 10,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMarker,
        tooltip: 'Add Marker',
        child: Icon(Icons.add),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker() {
    LatLng newLatLng = LatLng(
      37.7749 + markers.length * 0.01,
      -122.4194 + markers.length * 0.01,
    );
    markers.add(MarkerInfo(newLatLng));
    setState(() {});
  }

  void _updateMarker(MarkerInfo marker, LatLng newPosition) {
    setState(() {
      marker.latLng = newPosition;
    });
  }
}
