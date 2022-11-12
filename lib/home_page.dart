import 'package:flutter/material.dart';
import 'enclosed_map.dart';
import 'search_bar.dart';
import 'fullscreen_map.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.logoPath});

  final String logoPath;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Color baseColor = const Color(0xffffde5a);
Color accentColor = const Color(0xff065e40);

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
                                Icons.camera_alt,
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
        //TODO: fix theme and figure out how to use Theme.of(context) values instead of constants
        //color: baseColor,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //TODO: update Icons colors and sizes
            const Icon(Icons.home),
            const Icon(Icons.favorite),
            //TODO: update onPressed to open new camera screen
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FullScreenMap()));
              },
              child: const Icon(Icons.camera_alt),
            ),
            const Icon(Icons.calendar_month_rounded),
            const Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}