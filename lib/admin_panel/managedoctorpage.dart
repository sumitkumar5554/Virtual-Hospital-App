// import 'package:flutter/material.dart';
// import 'package:virtual_swaahth/models/doctor.dart';
//
// class ManageDoctorScreen extends StatefulWidget {
//   // Step 3: Define a callback function property
//   final Function(List<Doctor>) updateDoctorList;
//
//   ManageDoctorScreen({required this.updateDoctorList, Key? key}) : super(key: key);
//
//   @override
//   _ManageDoctorScreenState createState() => _ManageDoctorScreenState();
// }
//
// class _ManageDoctorScreenState extends State<ManageDoctorScreen> {
//   List<Doctor> doctors = [
//     Doctor(
//       name: 'Dr. Sourabh Mishra',
//       specialization: 'Therapist',
//       rating: 4.9,
//       image: 'doctor1.jpg',
//     ),
//     Doctor(
//       name: 'Dr. Emily Smith',
//       specialization: 'Pediatrician',
//       rating: 4.5,
//       image: 'doctor2.jpg',
//     ),
//     // Add more doctors here
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Manage Doctors'),
//       ),
//       body: ListView.builder(
//         itemCount: doctors.length,
//         itemBuilder: (context, index) {
//           final doctor = doctors[index];
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundImage: AssetImage('images/${doctor.image}'),
//             ),
//             title: Text(doctor.name),
//             subtitle: Text(doctor.specialization),
//             trailing: IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () {
//                 setState(() {
//                   doctors.removeAt(index);
//                   // Step 4: Call the callback function
//                   widget.updateDoctorList(doctors);
//                 });
//               },
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add a new doctor to the list
//           Doctor newDoctor = Doctor(
//             name: 'Dr. Jane Doe',
//             specialization: 'Dermatologist',
//             rating: 4.7,
//             image: 'doctor3.jpg',
//           );
//           setState(() {
//             doctors.add(newDoctor);
//             // Step 4: Call the callback function
//             widget.updateDoctorList(doctors);
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
