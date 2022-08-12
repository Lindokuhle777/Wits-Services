import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'splash.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
