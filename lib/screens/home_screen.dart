import 'package:flutter/material.dart';

import '../utils.dart';
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
      ('Packaging Cardboard', 6),
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
              style: FilledButton.styleFrom(backgroundColor: lightGreen),
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
            backgroundColor: extraLight,
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/person.jpg'),
                  ),
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
              Row(
                children: [
                  Text(
                    'Recent Activities',
                    style: TextStyle(
                      fontSize: headerTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => _ItemsPointsModal(),
                    ),
                    icon: CircleAvatar(
                      backgroundColor: lightGreen,
                      radius: 15.0,
                      child: Icon(
                        Icons.question_mark_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              for (final (material, point) in recentActivities)
                Column(
                  children: [
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
                    Divider(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemsPointsModal extends StatelessWidget {
  const _ItemsPointsModal();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        elevation: 10.0,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recyclable to points conversion\n',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              Text('Plastic Bottles = 5 points'),
              Text('Packaging cardboard = 10 points'),
              Text('Plastic cups = 3 points'),
              Text('Wooden planks = 6 points'),
            ],
          ),
        ),
      ),
    );
  }
}
