import 'package:flutter/material.dart';
import 'package:four_neat/provo_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'home_page.dart';

void main() => runApp(const FullScreenMap());

class FullScreenMap extends StatefulWidget {
  const FullScreenMap({super.key});

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  late GoogleMapController mapController;

  final LatLng _provo = const LatLng(40.2338, -111.6585);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Food Map'),
          //For some reason, inserting BackButton here does not work.
          //I don't have time to figure out why so I just hardcoded it
          leading: IconButton(
            onPressed: () {
              // method to show the search bar
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          // backgroundColor: Colors.green[700],
        ),
        body: const ProvoGoogleMap(),
      ),
    );
  }
}

//TODO: look into adding Podfile and iOS Google Maps API key
