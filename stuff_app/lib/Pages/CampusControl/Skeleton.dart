import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Skeleton extends StatefulWidget {
  String name;
  String btnAction;
  Widget itemsList;

  Skeleton(
      {Key? key,
      required this.name,
      required this.btnAction,
      required this.itemsList})
      : super(key: key);

  @override
  State<Skeleton> createState() => _SkeletonState(
      name: this.name, btnAction: btnAction, itemsList: itemsList);
}

class _SkeletonState extends State<Skeleton> {
  String name;
  String btnAction;
  Widget itemsList;

  _SkeletonState(
      {required this.name, required this.btnAction, required this.itemsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff115571),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: const <Widget>[
            Icon(
              Icons.security,
              color: Color(0xff115571),
            ),
            SizedBox(width: 8.0),
            Text("Campus Control", style: TextStyle(color: Color(0xff115571)))
          ],
        ),
        actions: <Widget>[
          PopupMenuButton(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: const CircleAvatar(
                    backgroundColor: Color(0xff31AFB4),
                    child: Text(
                      "L",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    )),
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/Home");
                        },
                        title: Text('Home'),
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/CampusControl");
                        },
                        title: Text('Logout'),
                      ),
                    ),
                  ])
        ],
      ),
      floatingActionButton: Container(
        width: 130.0,
        height: 40.0,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff31AFB4))),
          onPressed: () {
            if (name == "Next Stuff") {
              Navigator.pushReplacementNamed(context, "/OnRoute");
            } else if (name == "Destination") {
              Navigator.pushReplacementNamed(context, "/OnDuty");
            }
          },
          child: Row(
            children: <Widget>[
              Text(
                btnAction,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(width: 4.0),
              const Icon(
                Icons.navigate_next,
                size: 40.0,
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 150.0,
                child: Center(
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(flex: 4, child: itemsList)
          ],
        ),
      ),
    );
  }
}
