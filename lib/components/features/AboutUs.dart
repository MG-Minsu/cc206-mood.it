import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget { 
    
  const AboutUs({super.key}); 
  
  @override  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text('About Us'),), 
      body: Center( 
        child: Container (
          height: 350,
          width: 500,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.only(left: 20, right: 20),
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text("What is Mood.it?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Jost',
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                ),
          
                SizedBox(height: 15),

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text("Mood.it is an application that serve as a personal diary where you can post and detail your 'Mood' for the day. This, in some way, is a journalling method that can help you record and assess your day, perspective, and emotions.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 15,
                ),
                ), 
                ),                    

                SizedBox(height: 38),

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text("Developers",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Jost',
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                ),
                
                SizedBox(height: 15),

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text("Mathew Gabriel, Phoebe Grace Juayong, Glaiza Gynn Marmolejo, EJ Prince Sevilleno, Angelica Villar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 15,
                ),
                ),
                ),
                
                SizedBox(height: 5),

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text("Third year students taking up BS in Computer Science at WVSU College of ICT.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 10,
                ),
                ),
                ), 
              ]
            ),
        )
      ), 
    ); 
  } 
}