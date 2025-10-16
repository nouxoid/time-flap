import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Theme Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.light_mode),
            title: const Text('Light Mode'),
            trailing: Radio<ThemeMode>(
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: (value) {
                if (value != null) {
                  themeProvider.setThemeMode(value);
                }
              },
            ),
            onTap: () => themeProvider.setThemeMode(ThemeMode.light),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            trailing: Radio<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: themeProvider.themeMode,
              onChanged: (value) {
                if (value != null) {
                  themeProvider.setThemeMode(value);
                }
              },
            ),
            onTap: () => themeProvider.setThemeMode(ThemeMode.dark),
          ),
          ListTile(
            leading: const Icon(Icons.settings_system_daydream),
            title: const Text('System Default'),
            trailing: Radio<ThemeMode>(
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: (value) {
                if (value != null) {
                  themeProvider.setThemeMode(value);
                }
              },
            ),
            onTap: () => themeProvider.setThemeMode(ThemeMode.system),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Color Schemes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: ThemeProvider.colorSchemes.map((color) {
                return InkWell(
                  onTap: () => themeProvider.setColorScheme(color),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Features',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.lock_clock),
            title: Text('Lock Screen Display'),
            subtitle: Text('Keep screen on during timer'),
            trailing: Icon(Icons.check_circle, color: Colors.green),
          ),
          const ListTile(
            leading: Icon(Icons.battery_charging_full),
            title: Text('Charging Screen Saver'),
            subtitle: Text('Configure in Android system settings'),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('Version'),
            subtitle: Text('1.0.0'),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('About Time Flap'),
            subtitle: const Text('Focus timer app with Pomodoro technique'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Time Flap',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.timer, size: 48),
                children: [
                  const Text(
                    'A time management app featuring countdown timers, '
                    'Pomodoro technique, and task-specific focus timers. '
                    'Designed to help you stay focused and productive.',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
