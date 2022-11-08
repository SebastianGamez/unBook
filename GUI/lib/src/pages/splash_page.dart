// Imports
import 'package:flutter/material.dart';

// Splash widget (This widget has a variable state)
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

// Splash state
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _closeSplash();
    super.initState();
  }

  // There's finalizing the splash render and then, it's redirecting to the login
  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.pushReplacementNamed(context, 'login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/images/logo.png')),
      ),
    );
  }
}
