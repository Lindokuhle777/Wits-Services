import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:stuff_app/AuthServices.dart';
import 'package:stuff_app/Pages/Department.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSignedIn = true;
  String Letter = "";
  User? user = FirebaseAuth.instance.currentUser;

  // temp();

  void temp() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? k = user.displayName;
      Letter = k![0];
    } else {
      isSignedIn = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp();
  }

  void handleSignIn() async {
    await AuthServices().signIn();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? k = user?.displayName;
      Letter = k![0];
    }
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  void handleCard(int index) {
    String departmentName = departments[index].name;

    switch (departmentName) {
      case "Campus Control":
        {
          if (FirebaseAuth.instance.currentUser != null) {
            Navigator.pushReplacementNamed(context, "/CampusControl");
          } else {
            // TODO Show toast msg
          }
        }
        break;
      case "Bus Services":
        {
          print("Coming soon");
          // TODO implement Bus Services
        }
        break;
      default:
        {
          return;
        }
    }
  }

  List<Department> departments = [
    Department(name: "Bus Services", icon: Icons.bus_alert),
    Department(name: "Campus Control", icon: Icons.security),
    Department(name: "Dining Hall", icon: Icons.fastfood),
    Department(name: "CCDU", icon: Icons.health_and_safety),
    Department(name: "Campus Health", icon: Icons.health_and_safety),
    Department(name: "Events", icon: Icons.event)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff115571),
        appBar: AppBar(
          title: Image.asset("assets/three.jpg", fit: BoxFit.cover),
          actions: <Widget>[
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: FirebaseAuth.instance.currentUser == null
                  ? ElevatedButton(
                      onPressed: handleSignIn,
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.black),
                      ))
                  : CircleAvatar(
                      backgroundColor: const Color(0xff31AFB4),
                      child: Text(
                        FirebaseAuth.instance.currentUser!.displayName![0],
                        style: const TextStyle(fontSize: 20.0,color: Colors.white),
                      ),
                    ),
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: SizedBox(
                height: 150.0,
                child: Center(
                  child: Text(
                    "Departments",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  children: List.generate(
                    departments.length,
                    (index) => SizedBox(
                      height: 100.0,
                      child: InkWell(
                        onTap: () {
                          handleCard(index);
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 4,
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 60.0,
                                    child: Icon(
                                      departments[index].icon,
                                      size: 60.0,
                                      color: const Color(0xff31AFB4),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    departments[index].name,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            )
          ],
        ));
  }
}
