import 'package:flutter/material.dart';

// AboutUs is a StatelessWidget that displays information about the application and its developers.
class AboutUs extends StatelessWidget {
  // Declare a key parameter in your custom widget constructor.
  // Keys help Flutter framework in identifying widgets uniquely.
  final Key? key;

  // Assign the key parameter to the super constructor using named parameters.
  // This is a common pattern for widgets with keys.
  const AboutUs({Key? key}) : this.key = key, super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold provides a high-level structure for the about us screen.
    return Scaffold(
      // AppBar displays a top bar with a title.
      appBar: AppBar(title: const Text('About Us')),
      // The body of the scaffold contains the main content of the screen.
      body: Center(
        // Container to hold the content in a centered box.
        child: Container(
          height: 350,
          width: 500,
          // Margins for spacing around the container.
          margin: const EdgeInsets.symmetric(vertical: 10),
          // Padding inside the container.
          padding: const EdgeInsets.only(left: 20, right: 20),
          // Decoration for the container, including background color and box shadow.
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          // Column for vertical arrangement of widgets.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding widget for the title of the section.
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                // Text widget for displaying the title.
                child: Text(
                  "What is Mood.it?",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Jost',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox for spacing between widgets.
              SizedBox(height: 15),
              // Padding and Text for the application description.
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Mood.it is an application that serves as a personal diary where you can post and detail your 'Mood' for the day. This, in some way, is a journaling method that can help you record and assess your day, perspective, and emotions.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 38),
              // Padding and Text for the 'Developers' section.
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Developers",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Jost',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Padding and Text for listing the developers' names.
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Mathew Gabriel, Phoebe Grace Juayong, Glaiza Gynn Marmolejo, EJ Prince Sevilleno, Angelica Villar",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 5),
              // Padding and Text for additional information about the developers.
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Third year students taking up BS in Computer Science at WVSU College of ICT.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
