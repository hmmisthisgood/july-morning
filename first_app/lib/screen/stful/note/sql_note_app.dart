import 'package:first_app/service/db_service.dart';
import 'package:flutter/material.dart';

import 'note_edit_screen.dart';

class SqlNoteScreen extends StatefulWidget {
  const SqlNoteScreen({Key? key}) : super(key: key);

  @override
  State<SqlNoteScreen> createState() => _SqlNoteScreenState();
}

class _SqlNoteScreenState extends State<SqlNoteScreen> {
//  /home/user/Documents/
// C:\Users\computer\Documents\

  /// /storage/emulated/0/Downloads =ourandroid  visible

  /// /data/user/0/com.app/ = invisible. can only been seen with root

  //// Ios: sanboxing of every app
  /// /data/user/0/aweiubpawibuega/com.android.
  ///

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  List notes = [];
  @override
  void initState() {
    super.initState();
    initAndGetNotes();
  }

  getNotes() async {
    // db.rawQuery('select * from users');
    final result = await DbService.getNotes();
    notes = result;
    setState(() {});
  }

  initAndGetNotes() {
    DbService.initDatabase().then((value) {
      getNotes();
    });
  }

  addNote() async {
    await DbService.addNote(
        body: bodyController.text, title: titleController.text);
    getNotes();
  }

  deleteNote(int id) async {
    await DbService.deleteNote(id);
    getNotes();
  }

  updateNote(int noteId, String title, String body) async {
    await DbService.updateNote(
        noteId: noteId, title: titleController.text, body: bodyController.text);
  }

  onPressedDelete(item) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  "Are you sure you want to delete this note? This action is irreversible",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.green,
                        child: Text("Cancel "),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        color: Colors.red,
                        onPressed: () {
                          deleteNote(item['id']);
                          Navigator.pop(context);
                        },
                        child: Text("Proceed"),
                      ),
                    ),
                  ],
                )
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    addNote();
                  },
                  color: Colors.green,
                  child: Text("Add note"),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    getNotes();
                  },
                  child: Text("Fetch notes"),
                ),
              ),
            ],
          ),
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Note title"),
          ),
          TextField(
            controller: bodyController,
            decoration: InputDecoration(hintText: "Describe your note"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final item = notes[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => NoteEditScreen(note: item)))
                        .then((value) {
                      getNotes();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: screenWidth * 0.8,
                                child: Text(
                                  item['title'],
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    onPressedDelete(item);
                                  },
                                  child: Icon(Icons.delete, color: Colors.red))
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(item['body']),
                          SizedBox(
                            height: 8,
                          ),
                          Text(item['dateCreated']),
                          Divider(
                            thickness: 1,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
