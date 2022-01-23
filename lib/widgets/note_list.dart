import 'package:flutter/material.dart';
import 'package:note_app/database/database_model.dart';
import 'package:note_app/widgets/note_card.dart';

class NoteList extends StatelessWidget {
  final Function insertFunction;
  final Function deleteFunction;
  var db = DatabaseConnect();

  NoteList({
    Key? key,
    required this.insertFunction,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.getNoteList(),
      initialData: const [],
      builder: (context, AsyncSnapshot<List> snapshot) {
        var data = snapshot.data; // data shown as todo
        var datalength = data!.length;

        return datalength == 0
            ? Center(
                child: NoDataWidget(),
              )
            : GridView.builder(
                itemCount: datalength,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemBuilder: (context, index) => NoteCard(
                  id: data[index].id,
                  content: data[index].content,
                  creationTime: data[index].creationTime,
                  deleteFunction: deleteFunction,
                ),
              );
      },
    );
  }
}

class NoDataWidget extends StatelessWidget {
  String noDataText = "No note here...";
  NoDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: SizedBox(
        height: 100,
        width: 250,
        child: Center(
          child: Text(
            noDataText,
          ),
        ),
      ),
    );
  }
}
