import 'package:flutter/material.dart';
import 'package:note_app/Data/Notes.dart';
import 'package:note_app/Styles/Colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
        backgroundColor: color1,
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Icon(Icons.home),
            ),
          ),
        ],
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: allThemes.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: () {
                settingsBox.put('selectedTheme', index);
                color1 = allThemes[settingsBox.get('selectedTheme')][0];
                color2 = allThemes[settingsBox.get('selectedTheme')][1];
                color3 = allThemes[settingsBox.get('selectedTheme')][2];
                color4 = allThemes[settingsBox.get('selectedTheme')][3];
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.topCenter,
                      radius: 2,
                      tileMode: TileMode.mirror,
                      colors: [
                        allThemes[index][0],
                        allThemes[index][1],
                        allThemes[index][2],
                        allThemes[index][3],
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            );
          },
        ),
      ),
    );
  }
}
