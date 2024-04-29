import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = '';
  String _about = '';
  String _phoneNumber = '';
  File? _profileImage;
  File? _previousImage; // To store the previous profile image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: _selectProfilePicture,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: _profileImage != null
                              ? FileImage(_profileImage!)
                              : AssetImage("images/doctor1.jpg") as ImageProvider,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _showImageOptions,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: _name,
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              'About:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: _about,
              onChanged: (value) {
                setState(() {
                  _about = value;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              'Phone Number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: _phoneNumber,
              onChanged: (value) {
                setState(() {
                  _phoneNumber = value;
                });
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _saveProfile,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _selectProfilePicture() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  _takePhoto();
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _takePhoto() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  void _pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  void _saveProfile() {
    // Check if name is empty or contains only whitespace
    if (_name.trim().isEmpty) {
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Name cannot be empty!'),
        ),
      );
      return; // Exit function early
    }

    // Save profile functionality
    setState(() {
      // Update profile details
      _previousImage = _profileImage; // Store the current image as previous
      _profileImage = null; // Reset profile image
      _name = ''; // Reset name
      _about = ''; // Reset about
      _phoneNumber = ''; // Reset phone number
    });

    // Save profile data to Firestore
    FirebaseFirestore.instance.collection('doctorsprofile').add({
      'name': _name,
      'about': _about,
      'phoneNumber': _phoneNumber,
      // Save the profile image URL if available
      'profileImageURL': _previousImage != null ? _previousImage!.path : '',
    }).then((value) {
      // Show a snackbar to indicate success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile updated successfully!'),
        ),
      );
    }).catchError((error) {
      // Show a snackbar to indicate error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update profile: $error'),
        ),
      );
    });
  }
}




// import 'package:flutter/material.dart';
//
// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   // Variables to hold user data
//   String _name = '';
//   String _email = '';
//   String _password = '';
//   // DateTime _dateOfBirth;
//   String _countryRegion = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 // Implement functionality to change profile picture
//               },
//               child: CircleAvatar(
//                 radius: 50,
//                 // Placeholder avatar, you can replace it with the user's profile picture
//                 backgroundImage: AssetImage("images/doctor3.jpg"),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Name:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             TextFormField(
//               initialValue: _name,
//               onChanged: (value) {
//                 setState(() {
//                   _name = value;
//                 });
//               },
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Email:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             TextFormField(
//               initialValue: _email,
//               onChanged: (value) {
//                 setState(() {
//                   _email = value;
//                 });
//               },
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Password:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             TextFormField(
//               initialValue: _password,
//               onChanged: (value) {
//                 setState(() {
//                   _password = value;
//                 });
//               },
//               obscureText: true,
//             ),
//
//             SizedBox(height: 10),
//             Text(
//               'Country/Region:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             TextFormField(
//               initialValue: _countryRegion,
//               onChanged: (value) {
//                 setState(() {
//                   _countryRegion = value;
//                 });
//               },
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement save functionality
//               },
//               child: Text('Save'),
//
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: ProfileScreen(),
//   ));
// }
//
//
