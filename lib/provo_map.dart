import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProvoGoogleMap extends StatefulWidget {
  const ProvoGoogleMap({Key? key}) : super(key: key);

  final LatLng _provo = const LatLng(40.2338, -111.6585);

  @override
  State<ProvoGoogleMap> createState() => _ProvoGoogleMapState();
}

class _ProvoGoogleMapState extends State<ProvoGoogleMap> {
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      markers: Set<Marker>.of(_markers),
      initialCameraPosition: CameraPosition(
        target: _latLen[0],
        zoom: 15.0,
      ),
    );
  }

  // created empty list of markers
  final List<Marker> _markers = <Marker>[];

  // created list of coordinates of various locations
  final List<LatLng> _latLen = <LatLng>[
    LatLng(40.239736, -111.650255),
    LatLng(40.231981, -111.650195),
    LatLng(40.243961, -111.651708),
    LatLng(40.235006, -111.652649),
    LatLng(40.234836, -111.650255),
    LatLng(40.241135, -111.654807),
    LatLng(40.233913, -111.646923),
    LatLng(40.237250, -111.649715),
    LatLng(40.237191, -111.648620),
    LatLng(40.238869, -111.651669),
    LatLng(40.237979, -111.652958),
    LatLng(40.239565, -111.649673),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initialize loadData method
    loadData();
  }

  // created method for displaying custom markers according to index
  loadData() async {
    for (int i = 0; i < _latLen.length; i++) {
      // makers added according to index
      if (i == 0) {
        _markers.add(Marker(
          // given marker id
          markerId: MarkerId(i.toString()),
          // given marker icon
          icon: BitmapDescriptor.defaultMarkerWithHue(100.0),
          // given position
          position: _latLen[i],
          infoWindow: InfoWindow(
            // given title for marker
            title: 'Location: $i',
          ),
        ));
      } else {
        _markers.add(Marker(
          // given marker id
          markerId: MarkerId(i.toString()),
          // given marker icon
          icon: BitmapDescriptor.defaultMarker,
          // given position
          position: _latLen[i],
          infoWindow: InfoWindow(
            // given title for marker
            title: 'Location: $i',
          ),
        ));
      }
      setState(() {});
    }
  }
}
