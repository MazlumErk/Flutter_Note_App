import 'package:flutter/material.dart';
import 'package:note_app/Styles/Colors.dart';
import 'package:note_app/Data/Notes.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  double _sliderValue = 550;
  double _noteBoxHeight = 550;
  TextEditingController _noteTitleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
        backgroundColor: color1,
        title: Text('Add Note'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FittedBox(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: MediaQuery.of(context).size.width,
                      height: _noteBoxHeight,
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
                        padding: const EdgeInsets.all(16.0),
                        child: ListView(
                          children: [
                            TextField(
                              controller: _noteTitleController,
                              maxLength: 70,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: 'Note Title',
                              ),
                            ),
                            TextField(
                              controller: _noteController,
                              maxLines: 20,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                labelText: 'Note',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 16, right: 16),
                //   child: Align(
                //     alignment: Alignment.centerRight,
                //     child: SizedBox(
                //       width: 153,
                //       height: 40,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.only(
                //             topRight: Radius.circular(10),
                //             bottomRight: Radius.circular(10),
                //           ),
                //           gradient: LinearGradient(
                //             begin: Alignment.topLeft,
                //             end: Alignment.bottomRight,
                //             colors: [
                //               color1,
                //               color2,
                //               color3,
                //             ],
                //           ),
                //         ),
                //         child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //               backgroundColor: Colors.transparent,
                //               shadowColor: Colors.transparent),
                //           onPressed: () {},
                //           child: Row(
                //             children: [
                //               Icon(Icons.add),
                //               Text('Add New Note'),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 114,
                  decoration: BoxDecoration(
                    border: Border.all(width: 5,color: color4),
                    borderRadius: BorderRadius.circular(10),
                    gradient: RadialGradient(
                      center: Alignment.centerRight,
                      radius: 6,
                      tileMode: TileMode.mirror,
                      colors: [
                        color4,
                        color3,
                        color2,
                        color1,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Swipe to add note'),
                            Icon(Icons.swipe_right_alt_outlined)
                          ],
                        ),
                        RotatedBox(
                          quarterTurns: 90,
                          child: Slider(
                            activeColor: color1,
                            inactiveColor: color3,
                            min: 0,
                            max: 550,
                            value: _sliderValue,
                            onChanged: (value) {
                              if (value < 40) {
                                noteBox.put(1, 'aaaa');
                                _sliderValue = value;
                                setState(() {});
                                print(_noteTitleController.text);
                                print(_noteController.text);
                                Map _addingNewNote = {
                                  _noteTitleController.text:
                                      _noteController.text
                                };
                                selectedNote = _noteController.text.toString();
                                selectedNoteTitle =
                                    _noteTitleController.text.toString();
                                if (noteBox.get('noteBox') != null) {
                                  allNotes = noteBox.get('noteBox');
                                }
                                allNotes.add(_addingNewNote);
                                noteBox.put('noteBox', allNotes);
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/home',
                                  (Route<dynamic> route) => false,
                                );
                                // Navigator.pop(context);
                                return;
                              }
                              _sliderValue = value;
                              _noteBoxHeight = _sliderValue;
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
