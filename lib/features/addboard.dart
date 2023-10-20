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
            color: Colors.white, 
          ),
        ),
        leading: const Icon(
          Icons.clear, 
          size: 32.0, 
          color: Colors.white, 
        ),
        backgroundColor: const Color.fromARGB(255, 4, 102, 144), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    color: Colors.grey,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), 
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
