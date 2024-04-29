import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:virtual_swaahth/navbar_roots.dart';
import 'package:virtual_swaahth/signup_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 90),
              Container(
                height: 200,
                width: 200,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Lottie.network('https://lottie.host/d1d7a9d7-1617-4bb7-8921-dfe67a76d2d3/HXwX6Z5gXv.json'),

                ),
              ),
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 350, // Chote size ke anusaar width set karein
                  height: 70, // Chote size ke anusaar height set karein
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelText: "Enter Username", // Textfield ka label
                        prefixIcon: Icon(Icons.person), // Prefix icon
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: 350, // Chote size ke anusaar width set karein
                  height: 70, // Chote size ke anusaar height set karein
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      obscureText: passToggle ? true : false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelText: "Enter Password", // Textfield ka label
                        prefixIcon: Icon(Icons.lock), // Prefix icon
                        suffixIcon: InkWell(
                          onTap: () {
                            // Toggle password visibility
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: passToggle
                              ? Icon(CupertinoIcons.eye_slash_fill)
                              : Icon(CupertinoIcons.eye_fill),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),  // on tap on login then next scrn will apear code
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),

                  child: Material(
                    color: (Colors.purple.shade700),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => NavBarRoots()
                        ));
                      },
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                        child: Center(
                        child: Text(
                          "Log In",style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have any account?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                               builder: (context) => SignUpScreen()
                           ));
                    },
                    child: Text(
                        "Create Account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade700,
                      ),
                    ),
                  ),
                ],
              )
  ],
          ),
        ),
      ),
    );
  }
}
