import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page', style: GoogleFonts.lato()), // Custom font
        backgroundColor: Colors.yellow, // App bar background color
      ),
      body: Container(
        color: Colors.white54, // Background color of the page
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildFeatureItem(
                  'Remote Diagnostics',
                  'User-friendly interfaces for inputting symptoms and medical history.',
                  'assets/images/profile.png', // SVG icon asset
                ),
              ),
              _buildFeatureItem(
                'Virtual Consultations',
                'Secure platform for real-time video or chat consultations with doctors.',
                'assets/icons/virtual_consultation.svg', // SVG icon asset
              ),
              _buildFeatureItem(
                'Prescription Services',
                'Generate digital prescriptions based on remote diagnostics and consultations.',
                'assets/icons/prescription.svg', // SVG icon asset
              ),
              _buildFeatureItem(
                'Nearby Hospital Information',
                'Provides information on nearby hospitals, clinics, and pharmacies.',
                'assets/icons/hospital.svg', // SVG icon asset
              ),
              _buildFeatureItem(
                'User Education and Engagement',
                'Integrates educational resources and features for medication reminders.',
                'assets/icons/education.svg', // SVG icon asset
              ),
              _buildFeatureItem(
                'Multilingual Support',
                'Supports users with varying language preferences.',
                'assets/icons/language.svg', // SVG icon asset
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  'Developers Information  - ',
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDeveloperColumn('Sumit Kumar (Lead)', 'sumitk11455@gmail.com','images/sumit.jpeg'),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDeveloperColumn('Utkarsh Dubey', 'utkarshdubey1303@gmail.com','images/utkarsh.jpeg'),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDeveloperColumn('Atul Bisen', 'Atulbisen222@gmail.com','assets/images/profile.png'),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDeveloperColumn('Aditya Kotangle', 'Adityakotangle222@gmail.com','assets/images/profile.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15.0),
          Text(
            'Welcome to our Virtual Swaasth App!',
            style: GoogleFonts.poppins(
              fontSize: 18.0,
              color: Colors.black87, // Text color
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '"Virtual Swaasth App"',
            style: GoogleFonts.poppins(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.green, // Title color
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeveloperColumn(String name, String email, String profileImage) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage(profileImage),
        ),
        SizedBox(height: 10.0),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          email,
          style: GoogleFonts.poppins(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String title, String description, String iconPath) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 40.0,
            width: 40.0,
            color: Colors.blue, // Icon color
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Feature title color
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Colors.black87, // Feature description color
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