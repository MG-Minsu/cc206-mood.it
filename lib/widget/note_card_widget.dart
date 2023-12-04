import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/note.dart';

final _lightColors = [
  Color(0xFF9E8279),   // chilean-pink-0
  Color(0xFFD3AB9E),   // chilean-pink-1
  Color(0xFFEAC9C1),   // chilean-pink-2
  Color(0xFFEBD8D0),   // misty-rose
  Color(0xFFE9E9E9),   // snow
  Color(0xFFC4C3C3),   // snow-1
  Color(0xFFFEFEFF),   // white
];



class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey.shade700, fontStyle: FontStyle.normal,fontWeight: FontWeight.w300, fontSize: 10),
            ),
            const SizedBox(height: 4),
            Text(
              note.title,
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

  /// To return different height for different widgets
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
