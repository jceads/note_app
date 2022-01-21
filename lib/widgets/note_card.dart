import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';

class NoteCard extends StatefulWidget {
  NoteCard({
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

    /* var tempNote = Note(
      id: widget.id,
      content: widget.content,
      creationTime: widget.creationTime,
    );*/

    return Card(
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text(
                widget.content,
                style: TextStyle(overflow: TextOverflow.fade),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(widget.creationTime.toString().substring(0, 19)),
              ),
              IconButton(
                onPressed: () {
                  widget.deleteFunction(anotherNote);
                },
                icon: Icon(Icons.delete),
              )
            ],
          )
        ],
      ),
    );
// //çalışan kod
//     return Card(
//       child: Row(
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             //child: CheckBoxMethod(anotherTodo),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.content,
//                 ),
//                 SizedBox(height: 5),
//                 Text(widget.creationTime.toString().substring(0, 19))
//               ],
//             ),
//           ),
//           // IconButtonMethod(anotherTodo)
//         ],
//       ),
//     );
//     //çalışan kod
  }
}

// Column ColumnofContents(context) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       TitleTextMethod(context),
//       const SizedBox(height: 5),
//       CreationTimeTextMethod(),
//     ],
//   );
// }

// IconButton IconButtonMethod(Todo anotherTodo) {
//   return IconButton(
//     onPressed: () {
//       widget.deleteFunction(anotherTodo);
//     },
//     icon: const Icon(Icons.close),
//   );
// }

// Text CreationTimeTextMethod() =>
//     Text(widget.creationDate.toString().substring(0, 19));

// Text TitleTextMethod(context) {
//   return Text(
//     widget.title,
//     style: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 18,
//         decoration: widget.isChecked
//             ? TextDecoration.lineThrough
//             : TextDecoration.none),
//   );
// }

// return Card(
//       child: Column(
//         children: [
//           Text(widget.content),
//           Row(
//             children: [
//               Text(widget.creationTime.toString().substring(0, 19)),
//               IconButton(
//                 onPressed: widget.deleteFunction(tempNote),
//                 icon: const Icon(Icons.delete),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
