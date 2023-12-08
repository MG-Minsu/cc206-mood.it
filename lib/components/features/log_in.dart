import 'package:flutter/material.dart';
import '/components/features/AboutUs.dart';
import '/page/notes_page.dart';

void main() {
  runApp(LoginApp()); // Main entry point of the application.
}

// LoginApp is the root widget of the application.
class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define common text styles to be used across the app.
    final TextStyle bodyLarge = Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );

    final TextStyle bodyLargeBold = Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    // MaterialApp is the root of the app's material design widgets.
    return MaterialApp(
      // Define the theme for the application.
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 255, 255, 255),
        hintColor: Color.fromARGB(104, 248, 248, 248),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color.fromARGB(255, 26, 25, 25),
            fontFamily: 'Jost',
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          bodyText2: TextStyle(
            color: Colors.white, 
            fontFamily: 'Jost',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          headline1: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'Jost',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      // LoginPage is the first screen shown when the app starts.
      home: LoginPage(
        bodyLarge: bodyLarge,
        bodyLargeBold: bodyLargeBold,
      ),
    );
  }
}

// LoginPage widget represents the login screen of the app.
class LoginPage extends StatelessWidget {
  final TextStyle bodyLarge;
  final TextStyle bodyLargeBold;

  // Controllers to handle text input for username and password.
  final TextEditingController _usernameController = TextEditingController(); 
  final TextEditingController _passwordController = TextEditingController(); 

  // Constructor for LoginPage with required text styles.
  LoginPage({Key? key, required this.bodyLarge, required this.bodyLargeBold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the structure for the login page.
    return Scaffold(
      appBar: _buildAppBar(), // AppBar at the top of the page.
      body: Center(
        // Center widget to align contents in the center.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container for the login form.
            Container(
              height: 350,
              width: 300,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 248, 248),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Column(
                children: [
                  // Profile image container at the top of the form.
                  Container(
                    height: 80, // Adjust the height as needed
                    width: 80, // Adjust the width as needed
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('lib/components/assets/bg1.JPG'),
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  // Column for input fields and login button.
                  SizedBox(
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // TextField for username input.
                        TextField(
                          controller: _usernameController,
                          style: bodyLarge.copyWith(color: Color.fromARGB(255, 0, 0, 0)),
                          decoration: InputDecoration(
                            hintText: 'username',
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        // TextField for password input.
                        TextField(
                          controller: _passwordController,
                          style: bodyLarge.copyWith(color: Color.fromARGB(255, 0, 0, 0)),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'password',
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        // Button to trigger login action.
                        ElevatedButton(
                          onPressed: () {
                            // Logic to handle login validation.
                            if (_usernameController.text == '1' && _passwordController.text == '1') {
                              // Navigate to the NotesPage if credentials are correct.
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const NotesPage()),
                              );
                            } else {
                              // Handle incorrect credentials (currently just a print statement).
                              print('Incorrect username or password');
                            }
                          },
                          child: Text(
                            'Login',
                            style: bodyLargeBold.copyWith(color: const Color.fromARGB(255, 54, 54, 54)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Button to navigate to the AboutUs page.
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
              child: Text(
                'About Us',
                style: bodyLargeBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to build the AppBar widget.
AppBar _buildAppBar() {
  return AppBar(
    toolbarHeight: 75.0,
    centerTitle: true,
    title: const Text(
      "mood.it",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Jost',
        fontSize: 25,
      ),
    ),
    backgroundColor: const Color(0xFF9E8279), // Set the AppBar color to #9E8279
  );
}
