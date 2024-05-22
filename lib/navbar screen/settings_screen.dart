import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_swaahth/doctor_appointmentscreen.dart';
import 'package:virtual_swaahth/home_screen.dart';
import 'package:virtual_swaahth/screens/about_us.dart';
import 'package:virtual_swaahth/screens/feedback_screen.dart';
import 'package:virtual_swaahth/screens/logout_screen.dart';
import 'package:virtual_swaahth/screens/notification_screen.dart';
import 'package:virtual_swaahth/screens/privacy_screen.dart';
import 'package:virtual_swaahth/screens/profile_screen.dart';


class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top:50, left: 20,right: 20 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            ),

            SizedBox(height: 30),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("images/doctor1.jpg"),
              ),
              title: Text(
                "Dr. Bhavna Mehta",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              subtitle: Text("Profile"),
            ),

            Divider(height: 35),
            // ListTile(
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(
            //         builder: (context) => ProfileScreen()
            //     ));
            //   },
            //   leading: Container(
            //     padding: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       color: Colors.blue.shade100
            //       ,
            //       shape: BoxShape.circle,
            //     ),
            //     child: Icon(
            //       CupertinoIcons.person, // icon for profile
            //       color: Colors.blue,
            //       size: 35,
            //     ),
            //   ),
            //   title: Text("Profile",
            //   style: TextStyle(
            //     fontWeight: FontWeight.w500,
            //     fontSize: 20,
            //   ),
            //   ),
            //   trailing: Icon(Icons.arrow_forward_ios_rounded),
            // ),
            SizedBox(height: 20),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => NotificationScreen()
                ));
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.notifications_none_outlined, // icon for notifications
                  color: Colors.deepPurpleAccent,
                  size: 35,
                ),
              ),
              title: Text("Notifications",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 20),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PrivacyPage()
                ));
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.privacy_tip_outlined, // icon for privacy
                  color: Colors.blueAccent.shade400,
                  size: 35,
                ),
              ),
              title: Text("Privacy",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 20),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DoctorAppointmentScreen()
                ));
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.settings_suggest_rounded, // icon for setting general
                  color: Colors.green,
                  size: 35,
                ),
              ),
              title: Text("General",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded), // icons for arrow
            ),
            SizedBox(height: 20),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AboutPage()
                ));
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.info_outline_rounded, // icon for About us
                  color: Colors.orange,
                  size: 35,
                ),
              ),
              title: Text("About Us",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 20),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => FeedbackScreen()
                ));
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.feedback_outlined, // icon for feedback us
                  color: Colors.deepPurpleAccent.shade700,
                  size: 35,
                ),
              ),
              title: Text("Feedback",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(height: 40),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LogoutApp()
                ));
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.redAccent.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.logout, // icon for About us
                  color: Colors.redAccent.shade400,
                  size: 35,
                ),
              ),
              title: Text("Log Out",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
