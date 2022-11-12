import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

//TODO: update color scheme
Color baseColor = const Color(0xffffde5a);
Color accentColor = const Color(0xff065e40);
ColorScheme scheme = ColorScheme.light(
  primary: baseColor,
  onPrimary: Colors.black,
  secondary: accentColor,
  onSecondary: Colors.white,
);
ThemeData theme = ThemeData(
  colorScheme: scheme,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;

  runApp(MyApp(cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp(this.cameras, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4Neat',
      theme: ThemeData(
        colorScheme: scheme,
        //TODO: update primarySwatch to reflect actual color scheme
        // primaryColor: Colors.greenAccent
        //primarySwatch: MaterialColor(yellowBase),
      ),
      //TODO: replace with actual logo
      home: HomePage(cameras),
    );
  }
}
