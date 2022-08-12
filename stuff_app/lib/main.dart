import 'package:flutter/material.dart';
import 'package:stuff_app/Pages/CampusControl/onDuty.dart';
import 'package:stuff_app/Pages/Home.dart';
import 'package:stuff_app/Pages/Splash.dart';
import 'package:stuff_app/Pages/CampusControl/CampusControl.dart';
import 'Pages/CampusControl/OnRoute.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/":(context)=>const Splash(),
      "/Home":(context)=>const Home(),
      "/CampusControl":(context)=>const CampusControl(),
      "/OnDuty":(context)=> const OnDuty(),
      "/OnRoute":(context)=> const OnRoute()

    },
  ));
}

