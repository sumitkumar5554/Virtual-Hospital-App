import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade700,
        title: Text('Emergency Call'),
      ),
      body: Center(
        child: CallButton(),
      ),
    );
  }
}

class CallButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.call,
        color: Colors.green,
        size: 45,
      ),
      onPressed: () {
        _makePhoneCall('tel:9098857104');
      },
    );
  }

  // Function to make a phone call
  _makePhoneCall(String phoneNumber) async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: CallScreen(),
  ));
}


// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class CallScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Emergency Call'),
//       ),
//       body: Center(
//         child: CallButton(),
//       ),
//     );
//   }
// }
//
// class CallButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon(
//         Icons.call,
//         color: Colors.green,
//         size: 35,
//       ),
//       onPressed: () {
//         _makePhoneCall('tel:108');
//       },
//     );
//   }
//
//   // Function to make a phone call
//   _makePhoneCall(String phoneNumber) async {
//     if (await canLaunch(phoneNumber)) {
//       await launch(phoneNumber);
//     } else {
//       throw 'Could not launch $phoneNumber';
//     }
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: CallScreen(),
//   ));
// }
//
//
// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';
// // import 'package:flutter_sms/flutter_sms.dart';
// //
// // class CallScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Emergency Call'),
// //       ),
// //       body: Center(
// //         child: CallSOSButton(),
// //       ),
// //     );
// //   }
// // }
// //
// // class CallSOSButton extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return IconButton(
// //       icon: Icon(
// //         Icons.call,
// //         color: Colors.green,
// //         size: 35,
// //       ),
// //       onPressed: () {
// //         _makePhoneCallAndSendSOS('tel: 9098857104');
// //       },
// //     );
// //   }
// //
// //   // Function to make a phone call and send an SOS message
// //   _makePhoneCallAndSendSOS(String phoneNumber) async {
// //     if (await canLaunch(phoneNumber)) {
// //       _sendSOSMessage(phoneNumber);
// //       await launch(phoneNumber);
// //     } else {
// //       throw 'Could not launch $phoneNumber';
// //     }
// //   }
// //
// //   // Function to send an SOS message to the same number being called
// //   _sendSOSMessage(String phoneNumber) async {
// //     String message = 'Emergency! Please help!';
// //     List<String> recipients = [phoneNumber.substring(4)]; // Extract the number part from 'tel:108'
// //
// //     try {
// //       await sendSMS(message: message, recipients: recipients);
// //     } catch (error) {
// //       throw 'Failed to send SOS message: $error';
// //     }
// //   }
// // }
// //
// // void main() {
// //   runApp(MaterialApp(
// //     home: CallScreen(),
// //   ));
// // }
// //
// //
// // /////////////////////////////////////////////////////////////////////////////////
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:url_launcher/url_launcher.dart';
// // // import 'package:flutter_sms/flutter_sms.dart';
// // //
// // // class CallScreen extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Emergency Call'),
// // //       ),
// // //       body: Center(
// // //         child: CallSOSButton(),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class CallSOSButton extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return IconButton(
// // //       icon: Icon(
// // //         Icons.call,
// // //         color: Colors.green,
// // //         size: 35,
// // //       ),
// // //       onPressed: () {
// // //         _makePhoneCallAndSendSOS('tel:9098857104');
// // //       },
// // //     );
// // //   }
// // //
// // //   // Function to make a phone call and send an SOS message
// // //   _makePhoneCallAndSendSOS(String phoneNumber) async {
// // //     if (await canLaunch(phoneNumber)) {
// // //       await launch(phoneNumber);
// // //       _sendSOSMessage();
// // //     } else {
// // //       throw 'Could not launch $phoneNumber';
// // //     }
// // //   }
// // //
// // //   // Function to send an SOS message
// // //   _sendSOSMessage() async {
// // //     String message = 'Emergency! Please help!';
// // //     List<String> recipients = ['9098857104']; // SOS message recipient numbers
// // //
// // //     try {
// // //       await sendSMS(message: message, recipients: recipients);
// // //     } catch (error) {
// // //       throw 'Failed to send SOS message: $error';
// // //     }
// // //   }
// // // }
// // //
// // // void main() {
// // //   runApp(MaterialApp(
// // //     home: CallScreen(),
// // //   ));
// // // }
// // //
// // //
// // //
// // // // import 'package:flutter/material.dart';
// // // // import 'package:url_launcher/url_launcher.dart';
// // // //
// // // // class CallScreen extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Emergency Call'),
// // // //       ),
// // // //       body: Center(
// // // //         child: CallSOSButton(),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class CallSOSButton extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return IconButton(
// // // //       icon: Icon(
// // // //         Icons.call,
// // // //         color: Colors.green,
// // // //         size: 35,
// // // //       ),
// // // //       onPressed: () {
// // // //         _makePhoneCall('tel:108');
// // // //       },
// // // //     );
// // // //   }
// // // //
// // // //   // Function to make a phone call
// // // //   _makePhoneCall(String phoneNumber) async {
// // // //     if (await canLaunch(phoneNumber)) {
// // // //       await launch(phoneNumber);
// // // //     } else {
// // // //       throw 'Could not launch $phoneNumber';
// // // //     }
// // // //   }
// // // // }
// // // //
// // // // void main() {
// // // //   runApp(MaterialApp(
// // // //     home: CallScreen(),
// // // //   ));
// // // // }
