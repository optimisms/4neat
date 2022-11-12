import 'package:flutter/material.dart';

void main() => runApp(const ResultsScreen());

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Your Meal Results'),
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
        body: Padding(
          padding:
        ),
      ),
    );
  }
}

//TODO: look into adding Podfile and iOS Google Maps API key
