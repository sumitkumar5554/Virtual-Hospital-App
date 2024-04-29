import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatelessWidget {
  final String googleMapsUrl = "https://www.google.com/maps";

  void openGoogleMaps() async {
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Button'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            openGoogleMaps();
          },
          child: Text('Open Google Maps'),
        ),
      ),
    );
  }
}