import 'package:flutter/material.dart';

import '../utils.dart';

// import '../widgets/my_bottom_navbar.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const separationHeight = 20.0;
    const headerTextSize = 20.0;

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Scan & Dispose')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'QR Code Scanner',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: headerTextSize,
                  ),
                ),

                // Centered cam view
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const ShapeDecoration(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      height: 80.0,
                      width: 80.0,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Centerer Camera View',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: size.width - 136,
                          child:
                              Text('Click to open cam in full screen or read '
                                  'guidelines to scan QR code'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: separationHeight),

                // Manual Entry Option
                Text(
                  'Manual Code Entry',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: headerTextSize,
                  ),
                ),
                Card.outlined(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.qr_code_outlined,
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: _focusNode,
                            style: TextStyle(fontSize: 15.0),
                            onTapOutside: (_) => _focusNode.unfocus(),
                            controller: _textController,
                            decoration: InputDecoration(
                              hintText: 'Enter code below the QR code',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: separationHeight),

                // Confirm
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: lightGreen,
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Confirm'),
                    ),
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
