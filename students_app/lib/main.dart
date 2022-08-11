import 'package:flutter/material.dart';
import 'splash.dart';
import 'home.dart';

void main() {

  runApp(StudentsApp());
}

// The entry point of the app...
class StudentsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}
