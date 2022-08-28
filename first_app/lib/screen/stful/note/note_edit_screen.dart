import 'package:first_app/service/db_service.dart';
import 'package:flutter/material.dart';

class NoteEditScreen extends StatefulWidget {
  const NoteEditScreen({Key? key, required this.note}) : super(key: key);
  final note;

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    titleController.text = widget.note['title'];
    bodyController.text = widget.note['body'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Note")),
      bottomNavigationBar: MaterialButton(
        onPressed: () {
          DbService.updateNote(
              noteId: widget.note['id'],
              title: titleController.text,
              body: bodyController.text);
          Navigator.pop(context);
        },
        child: Text(
          "Update",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          TextField(
            controller: titleController,
            maxLines: 2,
            decoration: InputDecoration(hintText: "Note title"),
          ),
          TextField(
            controller: bodyController,
            maxLines: 20,
            decoration: InputDecoration(
                hintText: "Note Description", border: InputBorder.none),
          ),
        ]),
      ),
    );
  }
}
