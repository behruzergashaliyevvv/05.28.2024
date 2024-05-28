import 'package:flutter/material.dart';
import 'package:dars/controller/settings_controller.dart';
import 'package:dars/notifiers/settings_notifier.dart';
import 'package:dars/notifiers/note_notifier.dart';
import 'package:dars/notifiers/todo_notifier.dart';
import 'package:dars/views/screens/home_screen.dart';
import 'package:dars/controller/note_controller.dart';
import 'package:dars/controller/todo_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsNotifier(
      settingsController: SettingsController(),
      child: NoteNotifier(
        noteController: NoteController(),
        child: TodoNotifier(
          todoController: TodoController(),
          child: Builder(
            builder: (context) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                darkTheme: ThemeData.dark(),
                themeMode: SettingsNotifier.of(context).settings.themeMode,
                home: const HomeScreen(),
              );
            },
          ),
        ),
      ),
    );
  }
}
