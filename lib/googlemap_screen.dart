// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class MyButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         _launchGoogleMaps();
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//         child: Text(
//           "Nearby Hospitals",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//   _launchGoogleMaps() async {
//     const url = 'https://www.google.com/maps/search/query''https://www.google.com';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps Button'),
//       ),
//       body: Center(
//         child: MyButton(),
//       ),
//     ),
//   ));
// }
