import 'package:flutter/material.dart';
import 'package:islami_i/screens/splash/splash.dart';
import 'package:islami_i/screens/main/main.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Splash.routeName: (_) => Splash(),
        Main.routeName: (_) => Main(),
      },
      initialRoute: Splash.routeName,
    );

  }
}
