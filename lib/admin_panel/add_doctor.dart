import 'package:flutter/material.dart';

class AddDoctorPage extends StatefulWidget {
  @override
  _AddDoctorPageState createState() => _AddDoctorPageState();
}

class _AddDoctorPageState extends State<AddDoctorPage> {
  String _doctorName = '';
  String _specialization = '';
  String _contactNumber = '';

  // Function to handle adding doctor
  void _addDoctor() {
    // Logic to add doctor to database or perform necessary actions
    // Once doctor is added, you might want to navigate back to previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Doctor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Doctor Name'),
              onChanged: (value) {
                setState(() {
                  _doctorName = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Specialization'),
              onChanged: (value) {
                setState(() {
                  _specialization = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Contact Number'),
              onChanged: (value) {
                setState(() {
                  _contactNumber = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addDoctor();
              },
              child: Text('Add Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}
