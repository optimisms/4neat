import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Color yellowBase = const Color(0xffffde5a);
Color greenAccent = const Color(0xff065e40);
ColorScheme scheme = ColorScheme.light(
  primary: yellowBase,
  onPrimary: Colors.black,
  secondary: greenAccent,
  onSecondary: Colors.white,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4Neat',
      theme: ThemeData(
        colorScheme: scheme,

        //TODO: update primarySwatch to reflect actual color scheme
        //primarySwatch: MaterialColor(yellowBase),
      ),
      home: const MyHomePage(logoPath: 'assets/logo_generic.png'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.logoPath});

  final String logoPath;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(widget.logoPath, height: 40.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Food Map:',
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: Text(''),
            ),
            Container(
              child: Container(
                height: 150.0,
                width: 300.0,
                child: const EnclosedMap(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

// Widget getGoogleMap() {
//   return GoogleMap(
//       onMapCreated: _onMapCreated,
//       initialCameraPosition: CameraPosition(
//       target: _provo,
//       zoom: 14.0,
//   ),),
// }

//TODO: look into adding Podfile and iOS Google Maps API key

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late GoogleMapController mapController;
//
//   final LatLng _provo = const LatLng(40.2338, -111.6585);
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text('Maps Sample App'),
//         backgroundColor: Colors.green[700],
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _provo,
//           zoom: 14.0,
//         ),
//       ),
//     ),
//   );
//   }
// }
