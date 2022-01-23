import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';

class NewNote extends StatelessWidget {
  var controller = TextEditingController();

  NewNote({Key? key, required this.insertFunction}) : super(key: key);

  final Function insertFunction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(controller, context),
      body: textFieldContainer(context, controller),
    );
  }

  Container textFieldContainer(
      BuildContext context, TextEditingController controller) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.90,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: TextField(
        maxLines: 9999,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: "Add note here"),
      ),
    );
  }

  AppBar appBarMethod(TextEditingController controller, BuildContext context) {
    return AppBar(
      title: const Text("Add New Note"),
      actions: [addItemButton(controller, context)],
    );
  }

  IconButton addItemButton(
      TextEditingController controller, BuildContext context) {
    return IconButton(
        onPressed: () => onTapFunc(context), icon: Icon(Icons.check_outlined));
  }

  void onTapFunc(context) {
    var myNote = Note(content: controller.text, creationTime: DateTime.now());
    insertFunction(myNote);
    Navigator.pop(context);
  }
}
