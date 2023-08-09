import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(PropertyMapApp());
}

class PropertyMapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Map App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PropertyMapPage(),
    );
  }
}

class PropertyMapPage extends StatefulWidget {
  @override
  _PropertyMapPageState createState() => _PropertyMapPageState();
}

class _PropertyMapPageState extends State<PropertyMapPage> {
  final LatLng propertyLocation = LatLng(37.7749, -122.4194); // Example coordinates (San Francisco)
  String currentOwner = 'John Doe';
  String previousOwner = 'Jane Smith';
  String cost = '\$500,000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Property Map')),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(target: propertyLocation, zoom: 15.0),
                markers: {
                  Marker(markerId: MarkerId('propertyMarker'), position: propertyLocation),
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Current Owner: $currentOwner'),
            Text('Previous Owner: $previousOwner'),
            Text('Cost: $cost'),
          ],
        ),
      ),
    );
  }
}
