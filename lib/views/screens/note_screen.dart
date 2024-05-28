import 'package:flutter/material.dart';
import 'package:dars/notifiers/note_notifier.dart';
import 'package:dars/views/screens/add_note_screen.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: ListenableBuilder(
        listenable: NoteNotifier.of(context),
        builder: (ctx, child) {
          var notes = NoteNotifier.of(context).notes;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (ctx, index) {
              var note = notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                onTap: () {
                  // Handle note tap
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
