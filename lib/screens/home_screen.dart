import 'package:flutter/material.dart';
import 'package:note_app/database/database_model.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/screens/new_note.dart';
import 'package:note_app/widgets/note_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = DatabaseConnect();

  void addItem(Note note) async {
    await db.insertNote(note);
    setState(() {});
  }

  void deleteItem(Note note) async {
    await db.deleteNote(note);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notes"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewNote(
                      insertFunction: addItem,
                    ),
                  ));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: NoteList(
          deleteFunction: deleteItem,
          insertFunction: addItem,
        ));
  }
}
