import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PrescriptionApp());
}

class PrescriptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prescription Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrescriptionForm(),
    );
  }
}

class PrescriptionForm extends StatefulWidget {
  @override
  _PrescriptionFormState createState() => _PrescriptionFormState();
}

class _PrescriptionFormState extends State<PrescriptionForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  late String _gender = ''; // Initialize _gender with a default value
  TextEditingController _prescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _gender = 'Male'; // Set a default value for _gender
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Save prescription data to Firestore
      await FirebaseFirestore.instance.collection('prescriptions').add({
        'name': _nameController.text,
        'age': _ageController.text,
        'gender': _gender,
        'prescription': _prescriptionController.text,
        'timestamp': Timestamp.now(),
      });

      // Reset form fields
      _nameController.clear();
      _ageController.clear();
      _prescriptionController.clear();

      // Show success message or navigate to another screen
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Prescription submitted successfully!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Patient Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter patient name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Patient Age'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter patient age';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Patient Gender'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select patient gender';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _prescriptionController,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Prescription'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter prescription';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit Prescription'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
