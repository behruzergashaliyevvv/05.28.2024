import 'package:flutter/material.dart';
import 'package:dars/notifiers/todo_notifier.dart';
import 'package:dars/views/screens/add_todo_screen.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
      ),
      body: ListenableBuilder(
        listenable: TodoNotifier.of(context),
        builder: (ctx, child) {
          var todos = TodoNotifier.of(context).todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (ctx, index) {
              var todo = todos[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
                trailing: IconButton(
                  icon: Icon(todo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank),
                  onPressed: () {
                    TodoNotifier.of(context).toggleTodoComplete(todo.id);
                  },
                ),
                onTap: () {
                  // Handle todo tap
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
            MaterialPageRoute(builder: (context) => AddTodoScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
