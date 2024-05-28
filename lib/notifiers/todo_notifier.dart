import 'package:flutter/material.dart';
import 'package:dars/controller/todo_controller.dart';

class TodoNotifier extends InheritedWidget {
  final TodoController todoController;

  TodoNotifier({Key? key, required this.todoController, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant TodoNotifier oldWidget) {
    return oldWidget.todoController != todoController;
  }

  static TodoController of(BuildContext context) {
    final TodoNotifier? notifier = context.dependOnInheritedWidgetOfExactType<TodoNotifier>();
    assert(notifier != null, 'No TodoNotifier found in context');
    return notifier!.todoController;
  }
}
