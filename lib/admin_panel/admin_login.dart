import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:virtual_swaahth/admin_panel/admin_dashboard.dart';
import 'package:virtual_swaahth/admin_panel/admin_signup.dart';


class AdminLoginPage extends HookWidget {
  final List<Color> _gradientColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.deepPurple,
    Colors.grey,
    Colors.white,
    Colors.purpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);
    final backgroundIndex = useState(0);

    void login() {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      // Simulate a loading state
      isLoading.value = true;

      // Simulate a delay to mimic a login process
      Future.delayed(const Duration(seconds: 2), () {
        // Check if email and password are valid (you can add your own validation logic here)

        // Navigate to the next screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AdminDashboardPage()),
        );
      });
    }

    void createAccount() {
      // Navigate to the account creation page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminSignupPage()),
      );
    }

    void changeBackgroundColor() {
      final Random random = Random();
      final int newIndex = random.nextInt(_gradientColors.length);
      backgroundIndex.value = newIndex;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Login'),
      ),
      body: GestureDetector(
        onTap: changeBackgroundColor,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _gradientColors[backgroundIndex.value],
                _gradientColors[(backgroundIndex.value + 1) % _gradientColors.length],
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.red[800]!),
                    // Outer border color
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.email, color: Colors.black),
                      // Email icon
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.black),
                    // Text color
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.red[800]!),
                    // Outer border color
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                      // Password icon
                    ),
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    // Text color
                  ),
                ),
                const SizedBox(height: 32.0),
                isLoading.value
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                  onTap: () {
                    login(); // Call login function here
                    changeBackgroundColor();
                  },
                  child: ElevatedButton(
                    onPressed: login, // Call login function here
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 70),
                GestureDetector(
                    onTap: () {
                      createAccount();
                      changeBackgroundColor();
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Icon(
                                Icons.person_add,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: 'Create one',style: TextStyle(color: Colors.deepPurpleAccent),
                          ),
                        ],
                      ),
                    )

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
