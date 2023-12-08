import 'package:flutter/material.dart';
import '../db/notes_database.dart';
import '../model/note.dart';
import '../widget/note_form_widget.dart';

// AddEditNotePage is a StatefulWidget that allows users to add or edit notes.
class AddEditNotePage extends StatefulWidget {
  final Note? note; // Holds the note to be edited; if null, a new note will be added.

  // Constructor to initialize the AddEditNotePage. It may receive an existing note for editing.
  const AddEditNotePage({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<AddEditNotePage> createState() => _AddEditNotePageState();
}

// _AddEditNotePageState is the state associated with AddEditNotePage.
class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>(); // Key for the form widget to manage form state.
  late bool isImportant; // Flag to indicate if the note is marked as important.
  late int number;       // Numeric value associated with the note.
  late String title;     // Title of the note.
  late String description; // Description or content of the note.

  @override
  void initState() {
    super.initState();

    // Initialize state variables with values from the existing note or set default values.
    isImportant = widget.note?.isImportant ?? false;
    number = widget.note?.number ?? 0;
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 75.0,
          backgroundColor: const Color(0xFF9E8279), // Custom color for the AppBar.
          actions: [buildButton()], // Save button in the AppBar.
        ),
        body: Form(
          key: _formKey,
          child: NoteFormWidget(
            isImportant: isImportant,
            number: number,
            title: title,
            description: description,
            onChangedImportant: (isImportant) =>
                setState(() => this.isImportant = isImportant),
            onChangedNumber: (number) => setState(() => this.number = number),
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
          ),
        ),
      );

  // Widget to build the 'Save' button in the AppBar.
  Widget buildButton() {
    // Check if the form is valid (title and description are not empty).
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners for the button.
          ),
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10), // Padding inside the button.
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          backgroundColor: isFormValid ? null : Color.fromARGB(255, 255, 255, 255),
        ),
        onPressed: addOrUpdateNote, // Action to perform when the button is pressed.
        child: const Text('Save'),
      ),
    );
  }

  // Function to handle the addition or updating of a note.
  void addOrUpdateNote() async {
    // Validate the form before proceeding.
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      // Check if we are updating an existing note or adding a new one.
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote(); // Update the existing note.
      } else {
        await addNote();    // Add a new note.
      }

      Navigator.of(context).pop(); // Close the current screen after the operation.
    }
  }

  // Function to update an existing note.
  Future updateNote() async {
    // Create a new Note instance with updated values.
    final note = widget.note!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
    );

    // Call the database update method.
    await NotesDatabase.instance.update(note);
  }

  // Function to add a new note.
  Future addNote() async {
    // Create a new Note instance.
    final note = Note(
      title: title,
      isImportant: isImportant,
      number: number,
      description: description,
      createdTime: DateTime.now(),
    );

    // Call the database create method.
    await NotesDatabase.instance.create(note);
  }
}
