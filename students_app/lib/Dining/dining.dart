import 'package:flutter/material.dart';

class Dining extends StatefulWidget {
  @override
  State<Dining> createState() => _Dining();
}

class _Dining extends State<Dining> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dining Hall')),
      body: Text('Dining'),
    );
  }
}
