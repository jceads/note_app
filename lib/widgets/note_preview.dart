import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';

class NoteReview extends StatelessWidget {
  const NoteReview({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        // width: MediaQuery.of(context).size.width * 0.98,
        child: Card(
          child: Hero(
            tag: "${note.id}",
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                note.content,
              ),
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        ),
      ),
    );
  }
}
