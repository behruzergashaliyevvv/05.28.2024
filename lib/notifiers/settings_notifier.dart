import 'package:flutter/material.dart';
import 'package:dars/controller/settings_controller.dart';

class SettingsNotifier extends InheritedNotifier<SettingsController> {
  final SettingsController settingsController;

  SettingsNotifier({
    Key? key,
    required this.settingsController,
    required Widget child,
  }) : super(key: key, notifier: settingsController, child: child);

  static SettingsController of(BuildContext context) {
    final SettingsNotifier? notifier = context.dependOnInheritedWidgetOfExactType<SettingsNotifier>();
    assert(notifier != null, 'No SettingsNotifier found in context');
    return notifier!.settingsController;
  }
}
