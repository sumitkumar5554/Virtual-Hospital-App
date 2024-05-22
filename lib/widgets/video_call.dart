import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Meet Connector'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              launchGoogleMeet();
            },
            child: Text('Connect to the Doctor'),
          ),
        ),
      ),
    );
  }

  void launchGoogleMeet() async {
    const googleMeetLink = 'https://meet.google.com/';
    if (await canLaunch(googleMeetLink)) {
      await launch(googleMeetLink);
    } else {
      throw 'Could not launch $googleMeetLink';
    }
  }
}

