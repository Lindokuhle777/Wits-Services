import 'package:flutter/material.dart';

import '../Firebase/auth_service.dart';
import 'MapStuff/MapPage.dart';

class Protection extends StatefulWidget {
  const Protection({Key? key}) : super(key: key);

  @override
  State<Protection> createState() => _Protection();
}

class _Protection extends State<Protection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Control'), actions: [AuthService().handleAuthState()],),
      body: const MapPage(),
    );
  }
}
