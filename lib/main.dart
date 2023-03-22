import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/Screens/HomeScreen.dart';
import 'package:note_app/Data/Notes.dart';
import 'package:note_app/Screens/NewNotePage.dart';
import 'package:note_app/Screens/SettingsScreen.dart';
import 'package:note_app/Styles/Colors.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('noteBox');
  await Hive.openBox('settingsBox');
  // noteBox.delete('noteBox');
  // noteBox.delete(1);
  if(settingsBox.get('selectedTheme') == null){
    settingsBox.put('selectedTheme', 0);
  }

  if(noteBox.get('noteBox') != null){
    allNotes = noteBox.get('noteBox');
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home' : (context) => const Homepage(),
        '/newnote' :(context) => const NewNotePage(),
        '/settings' :(context) => const SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
