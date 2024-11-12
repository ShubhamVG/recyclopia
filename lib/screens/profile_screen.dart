import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/my_bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const separationHeight = 20.0;
    const headerTextSize = 20.0;

    // Dummy variables
    const name = 'John Doe';
    const points = 550;

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      bottomNavigationBar: const MyBottomNavbar(selectedIndex: 3),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // John Doe profile
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage: FileImage(File('assets/person.jpg')),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Points: $points',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: separationHeight),

                // Settings
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: headerTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications_rounded,
                    color: Colors.amber[800],
                  ),
                  title: Text('Notifications'),
                  subtitle: Text('on'),
                ),
                Divider(height: 5.0),
                ListTile(
                  leading: Icon(Icons.privacy_tip_rounded, color: Colors.teal),
                  title: Text('Profile visibility'),
                  subtitle: Text('Public'),
                ),
                Divider(height: 5.0),
                ListTile(
                  leading: Icon(
                    Icons.settings_accessibility_rounded,
                    color: Colors.blueGrey,
                  ),
                  title: Text('Accessibility'),
                  subtitle: Text('Default'),
                ),
                SizedBox(height: separationHeight),

                // Recycling Stats
                Text(
                  'Recycling Stats',
                  style: TextStyle(
                    fontSize: headerTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Total Recycled
                      Card.outlined(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Recycled',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                '250 kg',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text('+20% from last month'),
                            ],
                          ),
                        ),
                      ),

                      // Milestones
                      Card.outlined(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Milestones         ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text('Keep it up!'),
                            ],
                          ),
                        ),
                      ),

                      // Badges
                      Card.outlined(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Badges       ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(''),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
