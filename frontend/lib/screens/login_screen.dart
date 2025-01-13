import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils.dart';
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
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Transform.translate(
              offset: Offset(size.width / 2, -300.0),
              child: Transform.scale(
                scale: 40.0,
                child: CircleAvatar(
                  backgroundColor: extraLight,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0.0, -30.0),
              child: Image.asset('assets/logo.jpg'),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300.0),
                  child: Card(
                    color: Colors.white,
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
                            decoration: const InputDecoration(
                                hintText: 'E-mail address'),
                          ),
                          TextField(
                            controller: _passwordTextController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: darkGreen,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: seperationHeight),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () {
                                widget.setLoggedIn();
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) {
                                    return HomeScreen();
                                  }),
                                );
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: lightGreen,
                              ),
                              child: Text('LOG IN'),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Stack(
                            children: [
                              Divider(
                                color: extraLight,
                                height: 25.0,
                              ),
                              Center(
                                child: Card.filled(
                                  color: extraLight,
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
                                  style: IconButton.styleFrom(
                                    backgroundColor: extraLight,
                                  ),
                                  onPressed: () {},
                                  icon: Image.network(
                                    'http://pngimg.com/uploads/google/google_PNG19635.png',
                                    height: 30.0,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: extraLight,
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
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Color.fromRGBO(251, 111, 20, 1.0),
                      ),
                    ),
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
