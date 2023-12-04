//import '/components/features/home.dart';
import '/components/features/AboutUs.dart';
import 'package:flutter/material.dart';
import '/page/notes_page.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle bodyLarge = Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );

    final TextStyle bodyLargeBold = Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return MaterialApp(
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
      home: LoginPage(
        bodyLarge: bodyLarge,
        bodyLargeBold: bodyLargeBold,
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextStyle bodyLarge;
  final TextStyle bodyLargeBold;

  final TextEditingController _usernameController = TextEditingController(); 
  final TextEditingController _passwordController = TextEditingController(); 

 LoginPage({Key? key, required this.bodyLarge, required this.bodyLargeBold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  SizedBox(
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          controller: _usernameController,
                          style: bodyLarge.copyWith(color: Color.fromARGB(255, 0, 0, 0)),
                          decoration: InputDecoration(
                            hintText: 'username',
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 16.0),
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
                        ElevatedButton(
                          onPressed: () {
                            // Validate the entered username and password
                            if (_usernameController.text == '1' && _passwordController.text == '1') {
                              // If credentials are correct, navigate to the home page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const NotesPage()),
                              );
                            } else {
                              // If credentials are incorrect, you can show an error message or handle it as needed
                              // For now, let's print a message to the console
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
