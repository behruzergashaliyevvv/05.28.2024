import 'package:flutter/material.dart';
import 'package:dars/controller/note_controller.dart';

class NoteNotifier extends InheritedWidget {
  final NoteController noteController;

  NoteNotifier({Key? key, required this.noteController, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant NoteNotifier oldWidget) {
    return oldWidget.noteController != noteController;
  }

  static NoteController of(BuildContext context) {
    final NoteNotifier? notifier = context.dependOnInheritedWidgetOfExactType<NoteNotifier>();
    assert(notifier != null, 'No NoteNotifier found in context');
    return notifier!.noteController;
  }
}
