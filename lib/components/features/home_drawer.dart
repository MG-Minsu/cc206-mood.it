import 'package:cc206_moodit/components/features/addboard.dart';
import 'package:cc206_moodit/components/features/deleteboard.dart';
import 'package:cc206_moodit/components/features/home.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/components/assets/bg1.JPG'),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: DrawerHeader(
              padding: EdgeInsets.all(30),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Jost',
                ),
              ),
            ),
          ),
          // Remove Divider
          // Divider(
          //   height: 0,
          //   thickness: 0,
          //   color: Colors.transparent,
          // ),
          GestureDetector(
            onTap: () {
              // Action when Message is pressed
              print('Go back Page');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHome()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Action when Message is pressed
              print('Next Page');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DeleteBoard()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.public),
              title: Text('About Us'),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Action when Message is pressed
              print('Go back Page');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddBoard()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.add_box),
              title: Text('Add Board'),
            ),
          ),
        ],
      ),
    );
  }
}
