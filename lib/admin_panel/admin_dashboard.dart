import 'package:flutter/material.dart';
import 'package:virtual_swaahth/admin_panel/add_doctor.dart';

class AdminDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.logout,color: Colors.white,),
            onPressed: () {
              // Implement logout logic
              Navigator.pop(context);
            },
          ),
        ],
      ),
      // backgroundColor: Colors.deepPurpleAccent,  whole bg color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Welcome, Admin!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _AdminInfoCard(
                name: 'Sumit kumar',
                email: 'sumitk11455.com',
                imageUrl: 'images/sumit.jpeg', // Replace with the admin's image asset
              ),
              SizedBox(height: 20),
              // Quick Actions
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _QuickActionCard(
                        icon: Icons.person_add,
                        title: 'Add Doctor',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => AddDoctorPage(),
                              ),
                          );
                        },
                      ),
                      _QuickActionCard(
                        icon: Icons.person_add_alt_1,
                        title: 'Add Patient',
                        onPressed: () {
                          // Implement add patient logic
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => AddDoctorPage(),
                          //   ),
                          // );
                        },
                      ),
                      _QuickActionCard(
                        icon: Icons.calendar_today,
                        title: 'Add Appointment',
                        onPressed: () {
                          // Implement add appointment logic
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => AddDoctorPage(),
                          //   ),
                          // );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _QuickActionCard(
                        icon: Icons.group,
                        title: 'Staff Mem',
                        onPressed: () {
                          // Implement Staff Member integration logic
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => AddDoctorPage(),
                          //   ),
                          // );
                        },
                      ),
                      _QuickActionCard(
                        icon: Icons.note_add,
                        title: 'Add Prescription',
                        onPressed: () {
                          // Implement add prescription logic
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => AddDoctorPage(),
                          //   ),
                          // );
                        },
                      ),
                      _QuickActionCard(
                        icon: Icons.analytics,
                        title: 'View Reports',
                        onPressed: () {
                          // Implement view reports logic
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => AddDoctorPage(),
                          //   ),
                          // );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // New Features
              Text(
                'Admin Features',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _FeatureCard(
                    icon: Icons.manage_accounts,
                    title: 'Manage Doctors',
                    subtitle: 'View, add, or edit doctor details',
                    onPressed: () {
                      // Implement manage doctors logic
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AddDoctorPage(),
                      //   ),
                      // );
                    },
                  ),
                  _FeatureCard(
                    icon: Icons.people,
                    title: 'Manage Patients',
                    subtitle: 'View, add, or edit patient details',
                    onPressed: () {
                      // Implement manage patients logic
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AddDoctorPage(),
                      //   ),
                      // );
                    },
                  ),
                  _FeatureCard(
                    icon: Icons.event,
                    title: 'Manage Appointments',
                    subtitle: 'View, add, or edit appointments',
                    onPressed: () {
                      // Implement manage appointments logic
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AddDoctorPage(),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AdminInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  const _AdminInfoCard({
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imageUrl),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 100, // Reduced height
          width: 100, // Reduced width
          padding: EdgeInsets.all(12), // Adjusted padding
          decoration: BoxDecoration(
            color: Colors.deepPurple, // Set inner color to deep purple
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.white), // Icon color set to white
              SizedBox(height: 6),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color set to white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, size: 30, color: Colors.deepPurple),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
        onTap: onPressed,
      ),
    );
  }
}
