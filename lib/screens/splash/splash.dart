import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_i/screens/Intro/intro.dart';
import 'package:islami_i/screens/main/main.dart';
import 'package:islami_i/utils/app_assets.dart';
class Splash extends StatefulWidget {
  static const routeName = "splash";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushNamed(context, Intro.routeName);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppAssets.splash,
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
