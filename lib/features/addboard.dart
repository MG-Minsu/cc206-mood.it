import 'package:flutter/material.dart';

class AddBoard extends StatelessWidget {
  const AddBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Board",
          style: TextStyle(
            color: Colors.white, // Title text color
          ),
        ),
        leading: const Icon(
          Icons.clear, // This is the "X" icon
          size: 32.0, // Icon size in the AppBar
          color: Colors.white, // Icon color
        ),
        backgroundColor: Color.fromARGB(255, 4, 102, 144), // App bar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding to the entire body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
          children: [
            const SizedBox(height: 20), // Add some spacing below the AppBar
            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter Title',
                border: OutlineInputBorder(), // Add a border to the text field
              ),
            ),
            const SizedBox(height: 16), // Add spacing between text fields
            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter Mood content',
                border: OutlineInputBorder(), // Add a border to the text field
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add your login logic here
                // For simplicity, we're not handling authentication in this example.
                // You would typically validate the entered username and password.
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
