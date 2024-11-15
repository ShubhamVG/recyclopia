import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  if (isLoggedIn && !kDebugMode) {
    runApp(MyApp(prefs: prefs));
  } else {
    runApp(MyApp(prefs: prefs, toLogin: true));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.prefs, this.toLogin = false});

  final SharedPreferences prefs;
  final bool toLogin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: kDebugMode,
      home: toLogin ? LoginScreen(prefs: prefs) : const HomeScreen(),
    );
  }
}
