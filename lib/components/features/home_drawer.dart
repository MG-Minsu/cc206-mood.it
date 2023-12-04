import 'package:flutter/material.dart';
import 'package:sqflite_database_example/components/features/log_in.dart';

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
          GestureDetector(
            onTap: () {
              print('Go back Page');
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Next Page');
            },
            child: ListTile(
              leading: Icon(Icons.public),
              title: Text('About Us'),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Go back Page');
            },
            child: ListTile(
              leading: Icon(Icons.add_box),
              title: Text('Add Board'),
            ),
          ),
          GestureDetector(
            onTap: () {
              _showLogoutConfirmationDialog(context);
            },
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
            ),
          ),
        ],
      ),
    );
  }

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log Out', style: TextStyle(color: Colors.black)),
        content: Text('Are you sure you want to log out?', style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
            child: Text('Cancel', style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {
              // Navigate to the LoginApp page and close the current page
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginApp()),
                (Route<dynamic> route) => false, // Pop all existing routes
              );
            },
            child: Text('Log Out', style: TextStyle(color: Colors.black)),
          ),
        ],
      );
    },
  );
}
}