import 'package:flutter/material.dart';
import 'package:four_neat/provo_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const FullScreenMap());

class FullScreenMap extends StatefulWidget {
  const FullScreenMap({super.key});

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Food Map'),
          leading: const LocalBackButton(),
          // backgroundColor: Colors.green[700],
        ),
        body: const ProvoGoogleMap(),
      ),
    );
  }
}

class LocalBackButton extends StatelessWidget {
  const LocalBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }
}

//TODO: look into adding Podfile and iOS Google Maps API key
