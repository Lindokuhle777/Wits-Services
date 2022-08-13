import 'package:flutter/material.dart';
import 'home.dart';

// Custom splash screen...
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    // AuthService().handleAuthState();
    super.initState();
    _loadApp();
  }

// delaying the app while loading components...
  _loadApp() async {
    await Future.delayed(const Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(image: AssetImage('assets/wits.jpeg')),
      ),
    );
  }
}
