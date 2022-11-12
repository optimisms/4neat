import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'search_bar.dart';

//TODO: update color scheme
Color baseColor = const Color(0xffffde5a);
Color accentColor = const Color(0xff065e40);
ColorScheme scheme = ColorScheme.light(
  primary: baseColor,
  onPrimary: Colors.black,
  secondary: accentColor,
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
      //TODO: replace with actual logo
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
        actions: [
          //TODO: update these icons maybe, def get rid of search
          //TODO: update menu bar
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Hey!',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                ),
                Text(
                  'Let\'s get your order',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                Row(children: <Widget>[
                  Flexible(
                    flex: 1,
                    //TODO: make all buttons/widgets shadowed, see github
                    child: TextField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          hintText: 'Search for food nutrition and calories',
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(15),
                            width: 18,
                            child: const Icon(Icons.search),
                          ),
                          suffixIcon: Container(
                              padding: const EdgeInsets.all(15),
                              width: 18,
                              //TODO: replace this with the real icon and change yellow
                              child: Icon(
                                Icons.settings_overscan,
                                color: baseColor,
                              ))),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 150.0,
                  width: 300.0,
                  //TODO 1: add functionality where clicking map widget opens a full screen map
                  child: EnclosedMap(),
                ),
                //TODO: add row with "Popular" and "View all"
                //TODO: add layout with most recent meal
                //TODO 2: include functionality of pressing camera button opens camera
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: baseColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            //TODO: update Icons colors and sizes
            Icon(Icons.home),
            Icon(Icons.favorite),
            //TODO: update onPressed to open new camera screen
            FloatingActionButton(
              onPressed: null,
              child: Icon(Icons.settings_overscan),
            ),
            Icon(Icons.calendar_month_rounded),
            Icon(Icons.person),
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
