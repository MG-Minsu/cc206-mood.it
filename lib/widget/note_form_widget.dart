import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  // Properties for the note details
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;

  // Callbacks to handle changes in the note details
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  // Constructor for the NoteFormWidget
  const NoteFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title input field
              buildTitle(),
              const SizedBox(height: 8), // Spacer
              
              // Description input field
              buildDescription(),
              const SizedBox(height: 16), // Spacer
            ],
          ),
        ),
      );

  // Widget for the title input field
  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: const TextStyle(
          color: Color.fromARGB(179, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Title',
          hintStyle: TextStyle(color: Color.fromARGB(153, 85, 83, 83)),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedTitle, // Callback when the title changes
      );

  // Widget for the description input field
  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: description,
        style: const TextStyle(color: Color.fromARGB(153, 0, 0, 0), fontSize: 18),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Color.fromARGB(153, 85, 83, 83)),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedDescription, // Callback when the description changes
      );
}
