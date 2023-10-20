import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mood.it Login Page'),
      ),
      body: Center(
        child: Container (
          height: 350,
          width: 300,
          margin: const EdgeInsets.symmetric(vertical: 100),
          padding: const EdgeInsets.only(top: 90, left: 10, right: 10),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 5)
                )
              ]
            ),
          child: Column(
            children: [
              SizedBox (
                width: 250,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'username',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'password',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Add your login logic here
                    },
                    child: Text('Login'),
                  ),
            ],
          ),
            ),
            ]           
          ),
        ),
        
      ),
    );
  }
}
