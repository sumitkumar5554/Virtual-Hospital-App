import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:virtual_swaahth/admin_panel/admin_login.dart';
import 'package:virtual_swaahth/login_screen.dart';
import '../signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome Screen",
          style: TextStyle(
            color: Colors.white,

          ),
        ),
        backgroundColor: Colors.purple.shade700,
      ),
      body: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // SizedBox(height: 10),  // for skip button
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => NavBarRoots(),
              //         ),
              //       );
              //     },
              //     child: Text(
              //       "SKIP",
              //       style: TextStyle(
              //         color: Colors.purple.shade700,
              //         fontSize: 20,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Lottie.network(
                    'https://lottie.host/fa066139-7463-42d4-b91e-61574e3bfcff/u28BfI4SJn.json'),
              ),
              const SizedBox(height: 50),
              Text(
                "Virtual Hospital",
                style: TextStyle(
                  color: Colors.purple.shade700,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  wordSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Apoint your Doctor",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  wordSpacing: 1,
                ),
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Login Button
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 6,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Material(
                        color: Colors.purple.shade700,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Signup Button
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 6,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Material(
                        color: Colors.purple.shade700,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminLoginPage(),//admin signup page
                          ),
                        );
                        //Implement navigation to admin login screen
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.admin_panel_settings,
                            color: Colors.deepPurpleAccent,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Login as Admin",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//=======================================================================================

// import 'package:flutter/material.dart';
// import 'package:virtual_swaahth/admin_panel/doctor_signup.dart';
// import 'package:virtual_swaahth/signup_screen.dart';
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome Screen',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: WelcomeScreen(),
//     );
//   }
// }
//
// class WelcomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to Doctor Panel
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => DoctorSignUpScreen()),
//                 );
//               },
//               child: Text('Doctor Panel'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to User Panel
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignUpScreen()),
//                 );
//               },
//               child: Text('Login as a Paisent'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DoctorPanel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Doctor Panel'),
//       ),
//       body: Center(
//         child: Text('Welcome to Doctor Panel'),
//       ),
//     );
//   }
// }
//
// class UserPanel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Panel'),
//       ),
//       body: Center(
//         child: Text('Welcome to User Panel'),
//       ),
//     );
//   }
// }
