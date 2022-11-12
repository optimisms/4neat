import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EnclosedMap extends StatefulWidget {
  const EnclosedMap({Key? key}) : super(key: key);

  final LatLng _provo = const LatLng(40.2338, -111.6585);

  @override
  State<EnclosedMap> createState() => _EnclosedMapState();
}

class _EnclosedMapState extends State<EnclosedMap> {
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: widget._provo,
        zoom: 14.0,
      ),
    );
  }
}
