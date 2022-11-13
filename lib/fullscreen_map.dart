import 'package:flutter/material.dart';
import 'package:four_neat/provo_map.dart';

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
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text(
            'Food Map',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          //For some reason, inserting BackButton here does not work.
          //I don't have time to figure out why so I just hardcoded it
          leading: IconButton(
            onPressed: () {
              // method to show the search bar
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          // backgroundColor: Colors.green[700],
        ),
        // body: Column(
        //   children: <Widget>[
        //     Container(
        //       height: 200.0,
        //       width: 200.0,
        body: const ProvoGoogleMap(),
        //     ),
        //     Container(
        //       height: 200.0,
        //       width: 200.0,
        //       // child: Column(children: <Widget>[
        //       //   Row(
        //       //     children: <Widget>[
        //       //       Container(height: 100.0, width: 100.0),
        //       //     ],
        //       //   ),
        //       // ]),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

//TODO: look into adding Podfile and iOS Google Maps API key
