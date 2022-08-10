import 'package:flutter/material.dart';

class Buses extends StatefulWidget {
  @override
  State<Buses> createState() => _Buses();
}

class _Buses extends State<Buses> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wits Services')),
      body: Text('Buses'),
    );
  }
}
