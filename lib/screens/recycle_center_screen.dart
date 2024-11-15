import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils.dart';
import '../widgets/my_bottom_navbar.dart';
import 'scan_screen.dart';

class RecycleCenterScreen extends StatelessWidget {
  const RecycleCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const separationHeight = 20.0;
    const headerTextSize = 20.0;

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Recycle centers')),
      bottomNavigationBar: const MyBottomNavbar(selectedIndex: 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Map container and search button
                SizedBox(
                  height: size.height / 3.5,
                  width: double.infinity,
                  child: Card.filled(
                    color: Colors.green,
                    child: Image.asset('assets/map.jpg', fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(backgroundColor: lightGreen),
                    child: const Text('Search Nearby Centers'),
                  ),
                ),

                const SizedBox(height: separationHeight),

                // Recycling Tips
                const Text(
                  'Recycling Tips',
                  style: TextStyle(
                    fontSize: headerTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const ShapeDecoration(
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        height: 80.0,
                        width: 80.0,
                        child: Image.asset('assets/4r.jpg'),
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The 4 R\'s',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: size.width - 136,
                            child: Text(
                              'Discover tips to reduce waste at home',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const ShapeDecoration(
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        height: 80.0,
                        width: 80.0,
                        child: Image.asset('assets/Jute_Reusable.jpg'),
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Eco-Friendly Shopping',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: size.width - 136,
                            child: Text(
                              'Choose products with recyclable packaging',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: separationHeight),

                // Scan QR Code button
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ScanScreen()),
                      );
                    },
                    style: FilledButton.styleFrom(backgroundColor: lightGreen),
                    child: const Text('Scan QR Code of Dispose Machine'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
