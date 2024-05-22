import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_swaahth/home_screen.dart';
import 'package:virtual_swaahth/navbar%20screen/messages_screen.dart';
import 'package:virtual_swaahth/navbar%20screen/schedule_screen.dart';
import 'package:virtual_swaahth/navbar%20screen/settings_screen.dart';


class NavBarRoots extends  StatefulWidget{
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {

  int _selectedIndex = 0;
  final screens = [
    // Home screen
    HomeScreen(),
    // Message screen
    MessagesScreen(),
    // Schedule screen
    ScheduleScreen(),
    // Settings screen
    SettingsScreen(),
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black54,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index){
            setState(() {
              _selectedIndex = index;

            });
            
          },
          items: [
            BottomNavigationBarItem
              (icon:Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon:Icon(CupertinoIcons.chat_bubble_text_fill),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.calendar_month),
              label: "Schedule",
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.home_filled),
              label: "Settings",

            ),

          ],

        ),
      ),
    );
  }
}