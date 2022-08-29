import 'package:flutter/material.dart';
import 'Buses/buses.dart';
import 'Dining/dining.dart';
import 'Protection/protection.dart';
import 'Menu/menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  // store the current nav index...
  int _index = 0;

  // list of screen to show...
  final List<Widget> _screens = <Widget>[const Buses(), Dining(), const Protection(), Menu()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xff115571),
          onTap: _onNavigate,
          currentIndex: _index,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.bus_alert), label: 'Buses'),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), label: 'Dining Hall'),
            BottomNavigationBarItem(
                icon: Icon(Icons.security), label: 'Protection'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          ]),
    );
  }

  // method to change the bottom nav index...
  void _onNavigate(int index) {
    setState(() {
      _index = index;
    });
  }
}
