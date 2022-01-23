import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'note_preview.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({
    Key? key,
    required this.id,
    required this.content,
    required this.creationTime,
    required this.deleteFunction,
  }) : super(key: key);

  final int id;
  final String content;
  final DateTime creationTime;
  final Function deleteFunction;

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    var anotherNote = Note(
      id: widget.id,
      content: widget.content,
      creationTime: widget.creationTime,
    );

    return Card(
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: InkWell(
                onTap: () => goToPage(anotherNote),
                child: Hero(tag: "${widget.id}", child: contentText()),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              creationTimeText(),
              deleteButton(
                anotherNote,
              )
            ],
          )
        ],
      ),
    );
  }

  Padding creationTimeText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(widget.creationTime.toString().substring(0, 19)),
    );
  }

  IconButton deleteButton(Note anotherNote) {
    return IconButton(
      onPressed: () {
        widget.deleteFunction(anotherNote);
      },
      icon: Icon(Icons.delete),
    );
  }

  Text contentText() {
    return Text(
      widget.content,
      style: TextStyle(overflow: TextOverflow.fade),
    );
  }

  void goToPage(Note note) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NoteReview(
        note: note,
      ),
    ));
  }
}
