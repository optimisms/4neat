import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'fullscreen_map.dart';
import 'provo_map.dart';
import 'results_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final String logoPath = 'assets/logo_transp.png';

  @override
  State<HomePage> createState() => _HomePageState();
}

Color baseColor = const Color(0xffffde5a);
Color accentColor = const Color(0xff065e40);

class _HomePageState extends State<HomePage> {
  File? image;

  Future pickImageG() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        centerTitle: true,
        title: Image.asset(widget.logoPath, height: 45.0),
        // actions: [
        //   //TODO: update these icons maybe, def get rid of search
        //   //TODO: update menu bar
        //   IconButton(
        //     onPressed: () {
        //       // method to show the search bar
        //       showSearch(
        //         context: context,
        //         // delegate to customize the search bar
        //         delegate: CustomSearchDelegate(),
        //       );
        //     },
        //     icon: const Icon(Icons.search),
        //   )
        // ],
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
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 150.0,
                  width: 300.0,
                  //TODO 1: add functionality where clicking map widget opens a full screen map
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          //TODO: make it so that clicking the map itself opens the next screen
                          //TODO: add animation to open new screen from mapButton
                          builder: (context) => const FullScreenMap(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: ProvoGoogleMap(),
                    ),
                  ),
                ),
                //TODO: add row with "Popular" and "View all"
                //TODO: add layout with most recent meal
                //TODO 2: include functionality of pressing camera button opens camera
              ],
            ),
            // FloatingActionButton(
            //   onPressed: () {
            //     pickImageC();
            //     // await availableCameras().then((value) => Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //         builder: (_) =>
            //     //             TakePictureScreen(camera: value.first))));
            //   },
            //   child: const Icon(Icons.camera_alt),
            // ),
            const SizedBox(height: 20),
            image != null
                ? Image.file(image!, height: 10.0)
                : const Text("No image selected"),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //TODO: fix theme and figure out how to use Theme.of(context) values instead of constants
        color: baseColor,
        // color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //TODO: update Icons colors and sizes
            const Icon(Icons.home),
            const Icon(Icons.favorite),
            //TODO: update onPressed to open new camera screen
            FloatingActionButton(
              onPressed: () async {
                await pickImageC();
                if (image != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ResultsScreen(),
                  ));
                }

                // await availableCameras().then((value) => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) =>
                //             TakePictureScreen(camera: value.first))));
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
