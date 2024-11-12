import 'package:flutter/material.dart';

import '../widgets/my_bottom_navbar.dart';
import 'recycle_center_screen.dart';
import 'scan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const separationHeight = 20.0;
    const headerTextSize = 20.0;

    // Dummy variables
    const name = 'John Doe';
    const points = 550;
    const recentActivities = [
      ('Plastic', 5),
      ('Glass', 10),
      ('Paper', 3),
    ];

    final mediaQueryData = MediaQuery.of(context);
    final screenSize = mediaQueryData.size;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      bottomNavigationBar: const MyBottomNavbar(selectedIndex: 0),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: screenSize.width / 1.35,
              minHeight: 50.0,
            ),
            child: FilledButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RecycleCenterScreen()),
                );
              },
              child: const Text('Find recycle center'),
            ),
          ),
          const SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ScanScreen()),
              );
            },
            child: const Icon(Icons.qr_code_2_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome John Doe
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(child: Icon(Icons.person_outline_rounded)),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome $name',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Start recycling to earn rewards',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: separationHeight),

              // Total points
              const Text(
                'Total Points',
                style: TextStyle(
                  fontSize: headerTextSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: Card.outlined(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Points',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          points.toString(),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: separationHeight),

              // Recent Activities
              const Text(
                'Recent Activities',
                style: TextStyle(
                  fontSize: headerTextSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              for (final (material, point) in recentActivities)
                ListTile(
                  leading: const Icon(
                    Icons.recycling_rounded,
                    color: Colors.green,
                  ),
                  title: Text(material),
                  trailing: Text(
                    '$point Points',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
