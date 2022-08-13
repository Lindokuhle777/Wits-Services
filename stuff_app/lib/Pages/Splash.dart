import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stuff_app/AuthServices.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  func()  {
    AuthServices().CheckUser(context);

  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      print("WidgetsBinding");
      // AuthServices().signIn();
      Future.delayed(const Duration(seconds: 3),(){
        if(FirebaseAuth.instance.currentUser != null){
          Navigator.pushReplacementNamed(context, "/CampusControl");
        }else{
          Navigator.pushReplacementNamed(context, "/Home");
        }
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    // func();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
            image: AssetImage("assets/three.jpg"),
            fit: BoxFit.contain,
          )))),
    );
  }
}
