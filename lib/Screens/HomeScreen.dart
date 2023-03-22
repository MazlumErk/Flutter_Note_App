import 'package:flutter/material.dart';
import 'package:note_app/Data/Notes.dart';
import 'package:note_app/Styles/Colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
        backgroundColor: color1,
        title: Text('Note'),
        actions: [
          selectedNote == ''
              ? SizedBox()
              : InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: color4,
                          title: Text('This note will be deleted'),
                          content: RichText(
                            text: TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'The note titled '),
                                TextSpan(
                                  text: selectedNoteTitle,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: ' will be deleted'),
                              ],
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Text('The note titled '),
                          //     Text(selectedNoteTitle),
                          //     Text(' will be deleted'),
                          //   ],
                          // ),
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel',
                                  style: TextStyle(color: color1)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Delete',
                                  style: TextStyle(color: color1)),
                              onPressed: () {
                                allNotes.removeAt(selectedNoteIndex);
                                selectedNote = '';
                                setState(() {});
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(Icons.delete),
                  ),
                ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: color4,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text('You have ' + allNotes.length.toString() + ' note'),
                      Divider(
                        color: color1,
                        thickness: 3,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: allNotes != null ? allNotes.length : 0,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 16.0, top: 16, right: 16),
                      child: InkWell(
                        onTap: () {
                          selectedNoteIndex = index;
                          selectedNoteTitle = allNotes[index].keys.toString();
                          selectedNote = allNotes[index].values.toString();
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            gradient: RadialGradient(
                              center: Alignment.centerLeft,
                              radius: 10,
                              tileMode: TileMode.mirror,
                              colors: [
                                color1,
                                color2,
                                color3,
                              ],
                            ),
                          ),
                          child: Text(allNotes[index].keys.toString()),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Divider(
                      color: color1,
                      thickness: 3,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color2,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/settings');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text('Settings'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, index) {
          return selectedNote == ''
              ? SizedBox()
              : NoteBox(selectedNoteTitle, selectedNote);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color2,
        onPressed: () {
          Navigator.of(context).pushNamed('/newnote');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Padding NoteBox(String selectedNoteTitle, String selectedNote) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 2,
            tileMode: TileMode.mirror,
            colors: [
              color1,
              color2,
              color3,
            ],
          ),
          color: color3,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Text(
                selectedNoteTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Divider(
                color: color4,
                thickness: 5,
              ),
              Text('    ' + selectedNote),
            ],
          ),
        ),
      ),
    );
  }
}
