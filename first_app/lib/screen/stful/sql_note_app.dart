import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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

  int _version = 1;

  late Database db;

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  List notes = [];
  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();

    final dbPath = join(dir.path, "our_db.db");

    print(dbPath);

    final Database _db = await openDatabase(
      dbPath,
      version: _version,
      onConfigure: (db) {
        try {
          db.execute('''
  CREATE TABLE IF NOT EXISTS notes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR,
    body TEXT,
    dateCreated VARCHAR,
    dateUpdated VARCHAR);
''');
        } catch (e) {
          print(e);
        }
      },
      onOpen: (db) {},

      /// optinally called
      onCreate: (db, version) {},
      onUpgrade: (db, newVesion, oldVersion) {},
      onDowngrade: (db, newVesion, oldVersion) {},
    );
    db = _db;
  }

  addNote() async {
    try {
      await db.insert(
        "notes",
        {
          "title": titleController.text,
          "body": bodyController.text,
          "dateCreated": DateTime.now().toLocal().toString()
        },
      );
      titleController.clear();
      bodyController.clear();
      getNotes();
    } catch (e) {
      print(e);
    }
  }

  getNotes() async {
    // db.rawQuery('select * from users');
    try {
      final result = await db.query("notes");
      print(result);
      notes = result;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  deleteNote(int id) async {
    await db.delete("notes", where: "id=?", whereArgs: [id]);
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
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

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['title'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                                onTap: () {
                                  deleteNote(item['id']);
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
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
