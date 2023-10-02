import 'package:flutter/material.dart';

class AddBoard extends StatelessWidget {
  const AddBoard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // Add new board
          margin: EdgeInsets.fromLTRB(0, 0, 234, 4.58),
          child: Text(
            'Add New Board',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: Color(0xff000000),
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Enter Title'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Enter Text'),
        ),
        TextButton(
          // sidebarexit6LV (31:277)
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Container(
            width: 36.77,
            height: 39.58,
            child: Image.network(
              '[Image URL]',
              width: 36.77,
              height: 39.58,
            ),
          ),
        ),
        Positioned(
          // imagefill0wght400grad0opsz2411 (78:421)
          left: 358.5,
          top: 240,
          child: Align(
            child: SizedBox(
              width: 18,
              height: 18,
              child: Image.network(
                '[Image URL]',
                width: 18,
                height: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
