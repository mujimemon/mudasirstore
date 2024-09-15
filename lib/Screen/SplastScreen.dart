
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/WelcomeScreen/WelcomeScreen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/logom.jpg',
            height: 250,
            width: 250,
          ),
        ),
      ),
    );
  }
}
