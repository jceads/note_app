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
  // var db = DatabaseConnect();

  // void addItem(Note note) async {
  //   await db.insertNote(note);
  //   setState(() {});
  // }

  // void deleteItem(Note note) async {
  //   await db.deleteNote(note);
  //   setState(() {});
  // }
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
                icon: Icon(Icons.add))
          ],
        ),
        body: NoteList(
          deleteFunction: deleteItem,
          insertFunction: addItem,
        ));
  }
}

/*FutureBuilder(
        future: db.getNote(),
        initialData: const [],
        builder: (context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data; // data shown as todo
          var datalength = data!.length;

          return datalength == 0
              ? const Center(
                  child: Text("No not here..."),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) => NoteCard(
                    id: data[index].id,
                    content: data[index].content,
                    creationTime: data[index].creationTime,
                    deleteFunction: deleteItem,
                  ),
                );
        },
      ),*/