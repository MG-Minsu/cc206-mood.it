import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/note.dart';

// Predefined light colors for the note cards.
final _lightColors = [
  Color(0xFF9E8279),   // chilean-pink-0
  Color(0xFFD3AB9E),   // chilean-pink-1
  Color(0xFFEAC9C1),   // chilean-pink-2
  Color(0xFFEBD8D0),   // misty-rose
  Color(0xFFE9E9E9),   // snow
  Color(0xFFC4C3C3),   // snow-1
  Color(0xFFFEFEFF),   // white
];

// NoteCardWidget is a StatelessWidget that represents a single note card.
class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note; // The note to be displayed.
  final int index; // The index of the note in the list.

  @override
  Widget build(BuildContext context) {
    // Pick a color for the card based on the note's index.
    final color = _lightColors[index % _lightColors.length];
    // Format the creation time of the note.
    final time = DateFormat.yMMMd().format(note.createdTime);
    // Determine the minimum height for the card.
    final minHeight = getMinHeight(index);

    // Build the note card.
    return Card(
      color: color, // Set the background color of the card.
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight), // Set minimum height for the container.
        padding: const EdgeInsets.all(8), // Padding inside the card.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time, // Display the formatted time.
              style: TextStyle(color: Colors.grey.shade700, fontStyle: FontStyle.normal,fontWeight: FontWeight.w300, fontSize: 10),
            ),
            const SizedBox(height: 4), // Spacing between time and title.
            Text(
              note.title, // Display the title of the note.
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to determine the minimum height for a note card based on its index.
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
