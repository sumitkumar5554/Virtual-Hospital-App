import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:virtual_swaahth/call_sos_button.dart';
import 'package:virtual_swaahth/googlemap_screen.dart';
import 'package:virtual_swaahth/screens/make_appointment.dart';
import 'package:virtual_swaahth/screens/prescription_service.dart';
import 'package:virtual_swaahth/widgets/video_call.dart';

class AppointmentScreen extends StatelessWidget {

  List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade700,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,       // arrow of back icon
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Icon(
                    Icons.more_vert,       // three dot icon
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(radius: 35,
                    backgroundImage: AssetImage("images/doctor1.jpg"),
                  ),
                  SizedBox(height: 15),
                  Text("Dr. Arun Ghosi",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("Therapist",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => CallScreen()
                          ));
                        },
                        child: Container(

                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.green.shade700,
                            shape: BoxShape.circle,
                          ),

                          child: Icon(     //call icon
                            Icons.call,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => VideoCallScreen()
                          ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.redAccent.shade700,
                            shape: BoxShape.circle,
                          ),

                          child: Icon(     //call icon
                            CupertinoIcons.video_camera, // bubble msg icon manage
                            color: Colors.white,
                            size: 25,

                          ),

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // code of new sizebox here
            Container(
              height: MediaQuery.of(context).size.height /1.5,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "About Doctor",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
SizedBox(height: 5),
Text("Hi I am MBBS specialist and I have 10 years of Experience in Medical feild",
  style: TextStyle(
    fontSize:16,color: Colors.black54,
          ),
         ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Reviews",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      ),

                      SizedBox(height: 10),  // Rating of Review
                      Icon(Icons.star,color: Colors.amber),
                      Text("4.9",
                      style: TextStyle(
                          fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 5),
                      Text("(124)",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.purple.shade700),
                      ),
                      Spacer(),  // spacer align next widget to the end of row
                      TextButton(
                          onPressed: (){},
                          child: Text("See all",
                          style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 16,
                            color: Colors.purple.shade700,
                          ),
                          ),
                      ),
                    ],
                  ),
                  SizedBox(     // here is the code of 4 item count
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index){
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.shade100,
                            borderRadius: BorderRadius.circular(15),
                           boxShadow: [
                           BoxShadow(
                             color: Colors.blueGrey.shade900,
                             blurRadius: 4,
                             spreadRadius: 2,
                           ),
                           ],
                            ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width  /1.4,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                    AssetImage("images/${imgs[index]}"), // here is the icon of code here
                                  ),
                                  title: Text(
                                    "Dr. Priya Tiwari",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text("1 day ago"),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Text("4.9",
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5), // Sizebox for review comnt
                                Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Many thanks to Dr. Priya . She is a great and professional doctor",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),),
                                // child: Text(
                                //   maxLines:2, // use for line limitation
                                //   overflow: TextOverflow.ellipsis,
                                //   "Many thanks to Dr. Priya . She is a great and professional doctor ",
                                // style: TextStyle(
                                //   color: Colors.black,
                                // ),
                                // ),
                                ),

                              ],
                            ),
                          ),

                          );

                    },
                    ),
                  ),
                  // SizedBox(height: 35),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Navigator.push(context, MaterialPageRoute(
                  //     //     builder: (context) => MyButton()
                  //     // ));
                  //     // Implement save functionality
                  //   },
                  //   child: Text('Near by Hospital '),
                  //
                  //
                  // ),
                  SizedBox(height: 20),
                  Text("Prescription",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("Here you will get prescription by Doctor",
                  style: TextStyle(color: Colors.deepPurple,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>PrescriptionApp()
                      ));
                      // Implement save functionality
                    },
                    child: Text('Your Prescription'),


                  ),

                  // ListTile(
                  //   leading: Container(
                  //     padding: EdgeInsets.all(10),
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFFF0EEFA),
                  //       shape: BoxShape.circle
                  //   ),
                  //     child:Icon(
                  //
                  //       Icons.location_on,
                  //       // icon of location on
                  //       color: Colors.red,
                  //       size: 30,
                  //     ),
                  // ),
                  //   title: Text(
                  //
                  //     "Bhopal, Sagar Multispeciality Hospital",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 15,
                  //
                  //
                  //     ),
                  //   ),
                  //   subtitle: Text("Hospital in Bhopal Madhya Pradesh"),
                  // ),
                  Divider(height: 10),
      ],
        ),
       ),
      ],
     ),
    ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 135,
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Consultation Price",
                style: TextStyle(
                  color: Colors.black54,
                ),
                ),
                Text("\$100",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                        builder: (context) => BookAppointmentScreen()
                     ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.purple.shade700,
                ),
                child: Center(
                  child: Text("Book Appointment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
   );
  }
 }