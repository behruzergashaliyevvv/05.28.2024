import 'package:flutter/material.dart';
import 'package:dars/notifiers/settings_notifier.dart';
import 'package:dars/views/screens/home_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsNotifier = SettingsNotifier.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Settings"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 1000,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListenableBuilder(
                listenable: settingsNotifier,
                builder: (context, child) {
                  return SwitchListTile(
                    activeTrackColor: Colors.green,
                    value: settingsNotifier.settings.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      settingsNotifier.toggle(value);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
