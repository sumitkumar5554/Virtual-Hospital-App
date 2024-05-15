import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications',
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: const [
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Abhishek',
            timeAgo: '2 hours ago',
            image: "images/doctor3.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Priya',
            timeAgo: '1 day ago',
            image: "images/doctor2.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Smith',
            timeAgo: '3 days ago',
            image: "images/doctor4.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Emily',
            timeAgo: '3 days ago',
            image: "images/doctor4.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. John',
            timeAgo: '3 days ago',
            image: "images/doctor1.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Jessica',
            timeAgo: '3 days ago',
            image: "images/download2.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Michael',
            timeAgo: '3 days ago',
            image: "images/download1.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Olivia',
            timeAgo: '3 days ago',
            image: "images/download4.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. William',
            timeAgo: '3 days ago',
            image: "images/doctor2.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Sophia',
            timeAgo: '3 days ago',
            image: "images/download4.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Benjamin',
            timeAgo: '3 days ago',
            image: "images/download3.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Elizabeth',
            timeAgo: '3 days ago',
            image: "images/doctor4.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Jacob',
            timeAgo: '3 days ago',
            image: "images/doctor4.jpg", // Example image path
          ),
          NotificationItem(
            icon: Icons.notifications,
            name: 'Dr. Isabella',
            timeAgo: '3 days ago',
            image: "images/doctor4.jpg", // Example image path
          ),



          // Add more NotificationItems as needed
        ],
      ),
    );

  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final String timeAgo;
  final String image;

  const NotificationItem({
    Key? key,
    required this.icon,
    required this.name,
    required this.timeAgo,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      title: Text(name),
      subtitle: Text('Notification received $timeAgo'),
      onTap: () {
        // Add any action you want to perform when the notification is tapped
      },
    );

  }
}

