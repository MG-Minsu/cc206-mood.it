import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../db/notes_database.dart';
import '../model/note.dart';
import '../page/edit_note_page.dart';

// NoteDetailPage is a StatefulWidget that displays the details of a specific note.
class NoteDetailPage extends StatefulWidget {
  final int noteId; // ID of the note to be displayed.

  // Constructor to initialize NoteDetailPage with the required note ID.
  const NoteDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

// _NoteDetailPageState is the state associated with NoteDetailPage.
class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note; // Variable to hold the note details.
  bool isLoading = false; // Flag to indicate if the note is being loaded.

  @override
  void initState() {
    super.initState();

    refreshNote(); // Load the note details when the state is initialized.
  }

  // Function to refresh and load the note details.
  Future refreshNote() async {
    setState(() => isLoading = true); // Set loading state to true.

    note = await NotesDatabase.instance.readNote(widget.noteId); // Fetch the note from the database.

    setState(() => isLoading = false); // Set loading state to false.
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 75.0,
          backgroundColor: const Color(0xFF9E8279), // Custom color for the AppBar.
          actions: [editButton(), deleteButton()], // Edit and delete buttons in the AppBar.
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator()) // Show loading indicator while note is loading.
            : Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      note.title, // Display the note title.
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat.yMMMd().format(note.createdTime), // Display the formatted creation date.
                      style: const TextStyle(color: Color.fromARGB(153, 85, 83, 83), fontStyle: FontStyle.italic,fontWeight: FontWeight.w300, fontSize: 15,),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      note.description, // Display the note description.
                      style:
                          const TextStyle(color: Color.fromARGB(179, 0, 0, 0), fontSize: 18, fontStyle: FontStyle.normal,),
                    )
                  ],
                ),
              ),
      );

  // Widget to build the edit button.
  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined, color: Color.fromARGB(255, 255, 255, 255),),
      onPressed: () async {
        if (isLoading) return; // Do nothing if the note is currently loading.

        // Navigate to the edit note page and refresh the note details upon return.
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNotePage(note: note),
        ));

        refreshNote();
      });

  // Widget to build the delete button.
  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete, color: Color.fromARGB(255, 255, 255, 255),),
        onPressed: () async {
          await NotesDatabase.instance.delete(widget.noteId); // Delete the note from the database.

          Navigator.of(context).pop(); // Return to the previous screen.
        },
      );
}
