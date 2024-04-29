import 'package:flutter/material.dart';

class DoctorAppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Appointment App'),
        backgroundColor: Colors.deepPurple, // Changing app bar color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to our Doctor',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple, // Changing text color
              ),
            ),

            SizedBox(height: 10),

            Text(
              'Appointment App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple, // Changing text color
              ),
            ),

            SizedBox(height: 20),
            Text(
              'Features:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent, // Changing text color
              ),
            ),
            SizedBox(height: 10),
            _buildFeatureItem(
              icon: Icons.calendar_today,
              title: 'Schedule Appointments',
              description: 'Easily schedule appointments with your preferred doctors.',
              color: Colors.green, // Changing icon color
            ),
            _buildFeatureItem(
              icon: Icons.notifications_active,
              title: 'Get Reminders',
              description: 'Receive timely reminders for your upcoming appointments.',
              color: Colors.orange, // Changing icon color
            ),
            _buildFeatureItem(
              icon: Icons.search,
              title: 'Find Doctors',
              description: 'Search and find doctors based on specialty, location, and more.',
              color: Colors.purple, // Changing icon color
            ),
            _buildFeatureItem(
              icon: Icons.person,
              title: 'Personalized Profiles',
              description: 'Create and manage personalized profiles for you and your family members.',
              color: Colors.red, // Changing icon color
            ),
            _buildFeatureItem(
              icon: Icons.star,
              title: 'Rate and Review',
              description: 'Rate and review your experiences with doctors.',
              color: Colors.amber, // Changing icon color
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem({required IconData icon, required String title, required String description, required Color color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            size: 30,
            color: color, // Changing icon color
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Changing text color
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey, // Changing text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DoctorAppointmentScreen(),
  ));
}