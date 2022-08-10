import 'package:flutter/material.dart';

class Buses extends StatefulWidget {
  @override
  State<Buses> createState() => _Buses();
}

class _Buses extends State<Buses> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wits Services'),
        actions: [_profile()],
      ),
      body: Text('Buses'),
    );
  }

  Widget _profile() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.all(7.0),
        child: Row(
          children: [Text("A")],
        ));
  }
}
