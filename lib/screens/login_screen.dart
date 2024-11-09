import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.prefs});

  final SharedPreferences prefs;

  void setLoggedIn() async {
    await prefs.setBool('isLoggedIn', true);
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const seperationHeight = 20.0;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 300.0),
                child: Card(
                  color: Colors.green.shade200,
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Login Account',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          controller: _emailTextController,
                          decoration:
                              const InputDecoration(hintText: 'E-mail address'),
                        ),
                        TextField(
                          controller: _passwordTextController,
                          decoration:
                              const InputDecoration(hintText: 'Password'),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password?'),
                          ),
                        ),
                        const SizedBox(height: seperationHeight),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              widget.setLoggedIn();
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return HomeScreen();
                              }));
                            },
                            child: Text('LOG IN'),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Stack(
                          children: [
                            Divider(color: Colors.red, height: 25.0),
                            Center(
                              child: Card.filled(
                                margin: const EdgeInsets.only(top: 0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 5.0,
                                  ),
                                  child: Text('OR'),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: seperationHeight),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.resolveWith(
                                          (_) => Colors.white),
                                ),
                                onPressed: () {},
                                icon: Image.network(
                                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                                  height: 30.0,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              IconButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.resolveWith(
                                          (_) => Colors.white),
                                ),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.apple,
                                  size: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 10.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Register'),
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
