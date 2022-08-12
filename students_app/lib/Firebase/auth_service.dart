import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                    child: Text(FirebaseAuth.instance.currentUser!.displayName![0].toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)));
          } else {
            return InkWell(
              child: Container(
                  width: 85,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  margin:
                      const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                  child: Row(
                    children: const [
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  )),
              onTap: () {
                signInWithGoogle();
              },
            );
          }
        });
  }

  signInWithGoogle() async {
    //trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>['email']).signIn();

    //obtain the auth details from the request
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    //create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    //once signed in return the user's credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
