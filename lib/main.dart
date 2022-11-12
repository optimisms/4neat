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
        // primaryColor: Colors.greenAccent
        //primarySwatch: MaterialColor(yellowBase),
      ),
      //TODO: replace with actual logo
      home: const MyHomePage(),
    );
  }
}
