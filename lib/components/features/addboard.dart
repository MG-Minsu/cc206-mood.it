import 'package:flutter/material.dart';
import 'package:cc206_moodit/components/features/home_drawer.dart';


class AddBoard extends StatelessWidget {
  const AddBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        centerTitle: true, // Center-aligns the title
        title: const Text(
          "mood.it",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Jost',
            fontSize: 25,
          ),
          
        ),
        
        
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        //actions: [
        //  Padding(
        //    padding: const EdgeInsets.all(8.0),
        //    child: CircleAvatar(
        //      radius: 20,
        //      backgroundImage: AssetImage('lib/assets/bg1.JPG'), // Replace with your image path
        //    ),
        //  ),
        //],
        leading: Builder(
          builder: (BuildContext context) {
            return Row(
              children: [
                const Spacer(flex: 5,),
                IconButton(
                  icon: const Icon(
                    Icons.menu, // Hamburger icon
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Open the drawer
                  },
                ),
              ],
            );
          },
        ),
        //backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: const MyDrawer(), // Set MyDrawer as the drawer for the Scaffold
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 209, 207, 207),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Add Board"),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Mood content',
                      contentPadding: EdgeInsets.all(40),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        //Future development
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
