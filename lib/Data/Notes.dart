import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

var noteBox = Hive.box('noteBox');
var settingsBox = Hive.box('settingsBox');
List allNotes = [];
String selectedNoteTitle = '';
String selectedNote = '';
int selectedNoteIndex = 0;

List<List> allThemes = [themeBlue, themeBrown, themeGreen, themePink];

List<Color> themeBlue = [
  Color.fromARGB(255, 130, 170, 227),
  Color.fromARGB(255, 145, 216, 228),
  Color.fromARGB(255, 191, 234, 245),
  Color.fromARGB(255, 234, 253, 252),
];

List<Color> themeGreen = [
  Color.fromARGB(255, 64, 81, 59),
  Color.fromARGB(255, 96, 153, 102),
  Color.fromARGB(255, 157, 192, 139),
  Color.fromARGB(255, 237, 241, 214),
];

List<Color> themePink = [
  Color.fromARGB(255, 144, 94, 150),
  Color.fromARGB(255, 144, 94, 150),
  Color.fromARGB(255, 255, 153, 215),
  Color.fromARGB(255, 255, 211, 114),
];

List<Color> themeBrown = [
  Color.fromARGB(255, 135, 100, 69),
  Color.fromARGB(255, 202, 150, 92),
  Color.fromARGB(255, 238, 195, 115),
  Color.fromARGB(255, 244, 223, 186),
];