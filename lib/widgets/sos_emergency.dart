// import 'package:flutter/material.dart';
// import 'package:flutter_sms/flutter_sms.dart';
//
// class SOSButton extends StatelessWidget {
//   final String emergencyNumber;
//
//   SOSButton({required this.emergencyNumber});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _sendEmergencyMessage(emergencyNumber);
//       },
//       child: Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.red,
//           shape: BoxShape.circle,
//         ),
//         child: Icon(
//           Icons.warning,
//           color: Colors.white,
//           size: 35,
//         ),
//       ),
//     );
//   }
//
//   // Function to send an emergency message
//   void _sendEmergencyMessage(String phoneNumber) async {
//     String message = 'Emergency! Please help!';
//     List<String> recipients = [phoneNumber];
//
//     try {
//       await sendSMS(message: message, recipients: recipients);
//     } catch (error) {
//       throw 'Failed to send emergency message: $error';
//     }
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('SOS Button'),
//       ),
//       body: Center(
//         child: SOSButton(emergencyNumber: '1234567890'), // Replace '1234567890' with your desired emergency number
//       ),
//     ),
//   ));
// }
