import 'dart:io';

import 'package:flutter/material.dart';

// void main() => runApp(ResultsScreen());

Color baseColor = const Color(0xffffde5a);
Color accentColor = const Color(0xff065e40);
const Color primary = Color(0xffffde5a);
const Color onPrimary = Colors.black;
const Color secondary = Color(0xff065e40);
const Color onSecondary = Colors.white;

class ResultsScreen extends StatefulWidget {
  File image;
  ResultsScreen(this.image, {super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          title: const Text('Your Meal Results'),
          leading: IconButton(
            onPressed: () {
              // method to show the search bar
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          // backgroundColor: Colors.green[700],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const SizedBox(height: 1.0),
                        const Text(
                          'Your meal:',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(height: 1.0),
                        SizedBox(
                          height: 175.0,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                height: 10.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: Image.file(widget.image).image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 1.0),
                        const Text(
                          '',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(height: 1.0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    NutritionRow('Calories', '190'),
                    SizedBox(height: 5.0),
                    NutritionRow('Carbohydrates', '30g'),
                    SizedBox(height: 5.0),
                    NutritionRow('Sugar', '11g'),
                    SizedBox(height: 5.0),
                    NutritionRow('Fiber', '10g'),
                    SizedBox(height: 5.0),
                    NutritionRow('Protein', '25g'),
                    SizedBox(height: 5.0),
                    NutritionRow('Fats', '20g'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NutritionRow extends StatelessWidget {
  final String nutrientType;
  final String amount;
  const NutritionRow(
    this.nutrientType,
    this.amount, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // height: ,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  nutrientType,
                  style: const TextStyle(
                    fontSize: 17.0,
                    color: onPrimary,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: secondary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  amount,
                  style: const TextStyle(
                    color: onSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//TODO: look into adding Podfile and iOS Google Maps API key
