import 'package:flutter/material.dart';
import 'package:sqflite_database_example/components/features/log_in.dart';

// MyDrawer is a StatelessWidget that builds a navigation drawer for the app.
class MyDrawer extends StatelessWidget {
  // Constructor with an optional key.
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Drawer widget provides a slide-in menu from the edge of the screen.
    return Drawer(
      // ListView allows the drawer to have a list of items.
      child: ListView(
        // Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        // The children are the actual items of the drawer.
        children: <Widget>[
          // Container for the drawer header.
          Container(
            decoration: const BoxDecoration(
              // Background image for the drawer header.
              image: DecorationImage(
                image: AssetImage('lib/components/assets/bg1.JPG'),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            // DrawerHeader contains the main content of the header.
            child: DrawerHeader(
              // Padding inside the DrawerHeader.
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
          // GestureDetector for 'Home' item.
          GestureDetector(
            onTap: () {
              print('Go back Page'); // Action on tap.
            },
            child: ListTile(
              leading: Icon(Icons.home), // Icon for the item.
              title: Text('Home'), // Text label.
            ),
          ),
          // GestureDetector for 'Log Out' item.
          GestureDetector(
            onTap: () {
              _showLogoutConfirmationDialog(context); // Shows logout confirmation dialog.
            },
            child: ListTile(
              leading: Icon(Icons.logout), // Icon for the item.
              title: Text('Log Out'), // Text label.
            ),
          ),
        ],
      ),
    );
  }

  // Function to show a confirmation dialog when logging out.
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out', style: TextStyle(color: Colors.black)),
          content: Text('Are you sure you want to log out?', style: TextStyle(color: Colors.black)),
          actions: [
            // 'Cancel' button to dismiss the dialog.
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog.
              },
              child: Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
            // 'Log Out' button to log out and navigate to the login page.
            TextButton(
              onPressed: () {
                // Navigate to the LoginApp page and close the current page.
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginApp()),
                  (Route<dynamic> route) => false, // Pop all existing routes.
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
