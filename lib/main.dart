import 'package:flutter/material.dart';
import 'package:note_app/database/database_model.dart';
import 'package:note_app/model/note_model.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //DUMMY CODE
  var db = DatabaseConnect();

  //DUMMY CODE END

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Notes',
      home: HomePage(),
    );
  }
}
