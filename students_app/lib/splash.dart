import 'package:flutter/material.dart';
import 'home.dart';

// Custom splash screen...
class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _loadApp();
  }

// delaying the app while loading components...
  _loadApp() async {
    await Future.delayed(Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(image: AssetImage('assets/wits.jpeg')),
      ),
    );
  }
}
