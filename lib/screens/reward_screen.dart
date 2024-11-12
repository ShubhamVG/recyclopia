import 'package:flutter/material.dart';

import '../widgets/my_bottom_navbar.dart';
import 'redeem_history_screen.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const separationHeight = 20.0;
    const headerTextSize = 20.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Reward Store')),
      bottomNavigationBar: const MyBottomNavbar(selectedIndex: 2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Reward history
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => RedeemHistoryScreen()),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.history_rounded)),
                    title: Text('Rewards History'),
                    subtitle: Text(
                      'Find redeemed items & past transactions here',
                    ),
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 5.0),

              // Reedem Products
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: Text(
                  'Reedem Products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: headerTextSize,
                  ),
                ),
              ),

              // 'Reedem Products' horizontal scroll
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Row(children: [
                          Icon(Icons.house_rounded),
                          Text('Household'),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Row(children: [
                          Icon(Icons.checkroom_rounded),
                          Text('Clothing'),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Row(children: [
                          Icon(Icons.smartphone_rounded),
                          Text('Technology'),
                        ]),
                      ),
                    ),
                  ],
                ), // Products
              ),
              const SizedBox(height: separationHeight / 2),

              // Categories items
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: _ProductItem(
                        category: 'Household',
                        productName: 'Idk man',
                        points: 200,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: _ProductItem(
                        category: 'Household',
                        productName: 'Idk man',
                        points: 200,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: _ProductItem(
                        category: 'Household',
                        productName: 'Idk man',
                        points: 200,
                      ),
                    ),
                  ],
                ),
              ),

              // Redeem button
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Reedem as Cash'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem({
    required this.category,
    required this.productName,
    required this.points,
  });

  final String category;
  final String productName;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(category),
          ),
          Container(
            width: 150,
            height: 150,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName, style: const TextStyle(fontSize: 13.0)),
                Text(
                  '$points Points',
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
