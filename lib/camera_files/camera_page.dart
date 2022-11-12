// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
//
// class CameraPage extends StatefulWidget {
//   final List<CameraDescription>? cameras;
//   const CameraPage({Key? key, required this.cameras}) : super(key: key);
//   @override
//   State<CameraPage> createState() => _CameraPageState();
// }
//
// class _CameraPageState extends State<CameraPage> {
//   late CameraController _cameraController;
//
//   Future initCamera(CameraDescription cameraDescription) async {
// // create a CameraController
//     _cameraController =
//         CameraController(cameraDescription, ResolutionPreset.high);
// // Next, initialize the controller. This returns a Future.
//     try {
//       await _cameraController.initialize().then((_) {
//         if (!mounted) return;
//         setState(() {});
//       });
//     } on CameraException catch (e) {
//       debugPrint("camera error $e");
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // initialize the rear camera
//     initCamera(widget.cameras![0]);
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _cameraController.dispose();
//     super.dispose();
//   }
//
//   Future takePicture() async {
//     if (!_cameraController.value.isInitialized) {
//       return null;
//     }
//     if (_cameraController.value.isTakingPicture) {
//       return null;
//     }
//     try {
//       await _cameraController.setFlashMode(FlashMode.off);
//       XFile picture = await _cameraController.takePicture();
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => PreviewPage(
//                     picture: picture,
//                   )));
//     } on CameraException catch (e) {
//       debugPrint('Error occured while taking picture: $e');
//       return null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(leading: const BackButton()),
//         body: SafeArea(
//           child: _cameraController.value.isInitialized
//               ? CameraPreview(_cameraController)
//               : const Center(
//                   child: CircularProgressIndicator(),
//                 ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           // Provide an onPressed callback.
//           onPressed: () {
//             // // Take the Picture in a try / catch block. If anything goes wrong,
//             // // catch the error.
//             // try {
//             //   // Ensure that the camera is initialized.
//             //   // await _cameraController.value.isInitialized;
//             //
//             //   // Attempt to take a picture and then get the location
//             //   // where the image file is saved.
//             //   final image = await _cameraController.takePicture();
//             //
//             //   if (!mounted) return;
//             //
//             //   await Navigator.of(context).push(
//             //     MaterialPageRoute(
//             //       builder: (context) => DisplayPictureScreen(
//             //         // Pass the automatically generated path to
//             //         // the DisplayPictureScreen widget.
//             //         imagePath: image.path,
//             //       ),
//             //     ),
//             //   );
//             // } catch (e) {
//             //   // If an error occurs, log the error to the console.
//             //   print(e);
//             // }
//           },
//           child: const Icon(Icons.camera_alt),
//         ));
//   }
// }
//
// // A widget that displays the picture taken by the user.
// // class DisplayPictureScreen extends StatelessWidget {
// //   final String imagePath;
// //
// //   const DisplayPictureScreen({super.key, required this.imagePath});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Display the Picture')),
// //       // The image is stored as a file on the device. Use the `Image.file`
// //       // constructor with the given path to display the image.
// //
// //       //TODO: Why this error?
// //       body: Image.file(File(imagePath)),
// //     );
// //   }
// // }
