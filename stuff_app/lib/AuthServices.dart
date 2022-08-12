
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stuff_app/AuthServices.dart';




class AuthServices{

  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email'
      ]
  );

  CheckUser(BuildContext context) {

    GoogleSignInAccount? currUser;

    // var authStateChanges = FirebaseAuth.instance.authStateChanges();
    //
    // authStateChanges.listen((event) {
    //   // print(event);
    //   // currUser = event as GoogleSignInAccount?;
    // });




    _googleSignIn.onCurrentUserChanged.listen((event) {
      print(event);
      // currUser = event;
      print("!!!!!!!!");
      if (event == null) {
        print("We are here");
        Navigator.pushReplacementNamed(context, "/Home");
      } else {
        print("in");
        Navigator.pushReplacementNamed(context, "/CampusControl",
            arguments: {"name": event.displayName});
      }
      print("after");

    });

    // print(currUser);

     _googleSignIn.signInSilently();


    // return currUser;
  }

  void signOut(){
    // FirebaseAuth.instance.signOut();
    _googleSignIn.signOut();
  }

  signIn() async{

    try {
      final GoogleSignInAccount? user = await GoogleSignIn(
          scopes: <String>["email"]
      ).signIn();

      final GoogleSignInAuthentication auth = await user!.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: auth.accessToken,
          idToken: auth.idToken
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(e){
      print("ffffffffffffffff");
      print(e);
    }

  }



}