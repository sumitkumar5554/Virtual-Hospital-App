// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
//
// // Define your missing variables here or import them from your constants files
//
// // Placeholder values for demonstration
// const String tEditProfile = "Edit Profile";
// const String tProfileImage = "assets/images/profile_image.png";
// final Color tPrimaryColor = Colors.blue;
// final Color tAccentColor = Colors.green;
// final Color tDarkColor = Colors.black;
// const double tFormHeight = 50.0;
// const String tProfile = "User Profile";
// const String tPassword = "Password";
// const String tFullName = "Full Name";
// const String tEmail = "Email";
// const String tPhoneNo = "Phone Number";
// // final Color tDarkColor = Colors.black;
// const String tJoined = "Joined: ";
// const String tJoinedAt = "2022-04-27"; // Example date
// const double tDefaultSize = 16.0;
// const String tProfileHeading = "Utkarsh Dubey";
// const String tProfileSubHeading = "utk001";
// // Placeholder value, replace with your default size
//
// class UpdateProfileScreen extends StatelessWidget {
//   const UpdateProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // final controller = Get.put(ProfileController()); // Uncomment if using GetX
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
//         title: Text(tEditProfile, style: Theme.of(context).textTheme.headline4),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(tDefaultSize),
//           child: Column(
//             children: [
//               // -- IMAGE with ICON
//               Stack(
//                 children: [
//                   SizedBox(
//                     width: 120,
//                     height: 120,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(100),
//                       child: Image.asset(
//                           'assets/images/profile.png'),),
//                   ),
//
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       width: 35,
//                       height: 35,
//                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
//                       child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 50),
//
//               // -- Form Fields
//               Form(
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       decoration: InputDecoration(label: Text(tFullName), prefixIcon: const Icon(LineAwesomeIcons.user)),
//                     ),
//                     const SizedBox(height: tFormHeight - 20),
//                     TextFormField(
//                       decoration: InputDecoration(label: Text(tEmail), prefixIcon: const Icon(LineAwesomeIcons.envelope_1)),
//                     ),
//                     const SizedBox(height: tFormHeight - 20),
//                     TextFormField(
//                       decoration: InputDecoration(label: Text(tPhoneNo), prefixIcon: const Icon(LineAwesomeIcons.phone)),
//                     ),
//                     const SizedBox(height: tFormHeight - 20),
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         label: const Text(tPassword),
//                         prefixIcon: const Icon(Icons.fingerprint),
//                         suffixIcon: IconButton(icon: const Icon(LineAwesomeIcons.eye_slash), onPressed: () {}),
//                       ),
//                     ),
//                     const SizedBox(height: tFormHeight),
//
//                     // -- Form Submit Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {}, // Change onPressed as per your requirement
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: tPrimaryColor,
//                           shape: const StadiumBorder(),
//                         ),
//                         child: Text(tEditProfile, style: TextStyle(color: tDarkColor)),
//                       ),
//                     ),
//                     const SizedBox(height: tFormHeight),
//
//                     // -- Created Date and Delete Button
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text.rich(
//                           TextSpan(
//                             text: tJoined,
//                             style: const TextStyle(fontSize: 12),
//                             children: [
//                               TextSpan(
//                                 text: tJoinedAt,
//                                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {}, // Change onPressed as per your requirement
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.redAccent.withOpacity(0.1),
//                             elevation: 0,
//                             foregroundColor: Colors.red,
//                             shape: const StadiumBorder(),
//                           ),
//                           child: const Text("Delete"),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }