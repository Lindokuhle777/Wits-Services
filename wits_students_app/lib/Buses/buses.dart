import 'package:flutter/material.dart';
import 'package:wits_students_app/Firebase/auth_service.dart';

class Buses extends StatefulWidget {
  const Buses({Key? key}) : super(key: key);

  @override
  State<Buses> createState() => _Buses();
}

class _Buses extends State<Buses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wits Services'),
        actions: [AuthService().handleAuthState()],
      ),
      body: const Text('Buses'),
    );
  }
}
