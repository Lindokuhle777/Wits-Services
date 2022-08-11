import 'package:flutter/material.dart';
import 'package:stuff_app/Pages/CampusControl/Skeleton.dart';


class OnRoute extends StatefulWidget {
  const OnRoute({Key? key}) : super(key: key);

  @override
  State<OnRoute> createState() => _OnRouteState();
}

class _OnRouteState extends State<OnRoute> {

  List<String> students = [
    "Student Digz",
    "Campus Africa",
    "Student Digz",
    "Campus Africa",
    "Student Digz",
    "Campus Africa",
    "Student Digz",
    "Campus Africa",
    "Student Digz",
    "Campus Africa",
  ];

  void handleCard(int index) {
    Navigator.pushReplacementNamed(context, "/onDuty");
  }

  Widget myList(){
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                handleCard(index);
              },
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    title: Text(
                      students[index],
                      style: const TextStyle(fontSize: 23.0),
                    ),
                  ),
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Skeleton(
        name: "Destination", btnAction: "Done", itemsList: myList());
  }
}

