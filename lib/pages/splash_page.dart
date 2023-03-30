import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isVisible = false;

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () => setState(() {
        isVisible = true;
      }),
    ).then((_) {
      Timer(const Duration(milliseconds: 2500),
          () => Navigator.pushNamed(context, 'login'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: isVisible ? 1 : 0,
          duration: const Duration(seconds: 2),
          child: const FlutterLogo(size: 150),
        ),
      ),
    );
  }
}
