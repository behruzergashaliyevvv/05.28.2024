import 'package:dars/notifiers/todo_notifier.dart';
import 'package:dars/views/models/todo.dart';
import 'package:flutter/material.dart';


class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _addTodo() {
    if (_formKey.currentState!.validate()) {
      var newTodo = Todo(
        id: DateTime.now().toString(),
        title: _titleController.text,
        description: _descriptionController.text,
        date: _selectedDate,
      );

      TodoNotifier.of(context).addTodo(newTodo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
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
                controller: _descriptionController,
                decoration: InputDecoration(labelText: "Description"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a description";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _addTodo,
                child: Text("Add Todo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
