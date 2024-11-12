import 'package:flutter/material.dart';

class RedeemHistoryScreen extends StatelessWidget {
  const RedeemHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const headerTextSize = 20.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Redeem History')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Redeemed items list',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: headerTextSize,
                  ),
                ),

                // List
                ListTile(
                  leading: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  title: Text("Item 1"),
                  subtitle: Text('200 points'),
                  trailing: Icon(Icons.location_searching_rounded),
                ),
                Divider(),

                ListTile(
                  leading: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  title: Text("Item 1"),
                  subtitle: Text('200 points'),
                  trailing: Icon(Icons.location_searching_rounded),
                ),
                Divider(),

                ListTile(
                  leading: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  title: Text("Item 1"),
                  subtitle: Text('200 points'),
                  trailing: Icon(Icons.location_searching_rounded),
                ),
                Divider(),

                ListTile(
                  leading: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  title: Text("Item 1"),
                  subtitle: Text('200 points'),
                  trailing: Icon(Icons.location_searching_rounded),
                ),
                Divider(),
              ],
            ),
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
