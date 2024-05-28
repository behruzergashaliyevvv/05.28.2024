import 'package:dars/notifiers/note_notifier.dart';
import 'package:dars/views/models/note.dart';
import 'package:flutter/material.dart';


class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _addNote() {
    if (_formKey.currentState!.validate()) {
      var newNote = Note(
        id: DateTime.now().toString(),
        title: _titleController.text,
        content: _contentController.text,
        createdDate: DateTime.now(),
      );

      NoteNotifier.of(context).addNote(newNote);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: "Title"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(labelText: "Content"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter content";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _addNote,
                child: Text("Add Note"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
