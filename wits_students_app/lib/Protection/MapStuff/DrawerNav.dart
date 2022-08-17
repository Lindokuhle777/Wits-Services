import 'package:flutter/material.dart';

class DrawerNav extends StatefulWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  State<DrawerNav> createState() => _DrawerNavState();
}

class _DrawerNavState extends State<DrawerNav> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 100,
            color: Colors.grey[350],
            child: DrawerHeader(
              child: Center(
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1595152772835-219674b2a8a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                  ),
                  title: const Text('Amir Seilsepour'),
                  subtitle: const Text('Edit Profile'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/home/profile');
                  },
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.credit_card,
              color: Colors.black,
            ),
            title: const Text('Payment'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home/payment');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.discount_sharp,
              color: Colors.black,
            ),
            title: const Text('Promotions'),
            subtitle: const Text('Enter Promo Code'),
            onTap: () {},
            trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  minimumSize: const Size(70, 30),
                  maximumSize: const Size(70, 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
              child: const Text('NEW'),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.history,
              color: Colors.black,
            ),
            title: const Text('My Rides'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.work,
              color: Colors.black,
            ),
            title: const Text('Work Rides'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.support,
              color: Colors.black,
            ),
            title: const Text('Support'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.black,
            ),
            title: const Text('About'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
