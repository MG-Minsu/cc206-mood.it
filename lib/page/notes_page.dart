import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '/components/features/home_drawer.dart';
import '../db/notes_database.dart';
import '../model/note.dart';
import '../page/edit_note_page.dart';
import '../page/note_detail_page.dart';
import '../widget/note_card_widget.dart';

// NotesPage is a StatefulWidget that displays a list of notes.
class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

// _NotesPageState is the state associated with NotesPage.
class _NotesPageState extends State<NotesPage> {
  late List<Note> notes; // List to hold notes.
  bool isLoading = false; // Flag to indicate if notes are being loaded.

  @override
  void initState() {
    super.initState();
    refreshNotes(); // Load notes when the widget is initialized.
  }

  @override
  void dispose() {
    NotesDatabase.instance.close(); // Close the database when the widget is disposed.
    super.dispose();
  }

  // Function to refresh and load notes from the database.
  Future<void> refreshNotes() async {
    setState(() => isLoading = true); // Set loading state to true.
    notes = await NotesDatabase.instance.readAllNotes(); // Fetch all notes.
    setState(() => isLoading = false); // Set loading state to false.
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(), // Custom app bar.
        drawer: const MyDrawer(), // Drawer for navigation.
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Positioned widgets for layout structure.
            Positioned(
              top: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '“Share your thoughts with mood.it”',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: isLoading
                  ? CircularProgressIndicator() // Show loading indicator.
                  : notes.isEmpty
                      ? Text(
                          'No Notes',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 24,
                          ),
                        )
                      : buildNotes(), // Display notes.
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddEditNotePage()),
            );

            refreshNotes(); // Refresh notes after adding/editing.
          },
        ),
      );

  // Function to build the notes grid.
  Widget buildNotes() => StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: List.generate(
          notes.length,
          (index) {
            final note = notes[index];

            return GestureDetector(
              onTap: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NoteDetailPage(noteId: note.id!),
                ));

                refreshNotes(); // Refresh notes after viewing a note.
              },
              child: NoteCardWidget(note: note, index: index),
            );
          },
        ),
      );

// Function to build the custom AppBar.
AppBar _buildAppBar() {
  return AppBar(
    toolbarHeight: 75.0,
    centerTitle: true,
    title: const Text(
      "mood.it",
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Jost',
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ),
    backgroundColor: const Color(0xFF9E8279),
    leading: Builder(
      builder: (BuildContext context) {
        return Row(
          children: [
            const Spacer(flex: 5),
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        );
      },
    ),
  );
}
}