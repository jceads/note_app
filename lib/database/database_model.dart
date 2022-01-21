import 'dart:async';
import 'package:note_app/model/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnect {
  Database? _database;
  final String _tableName = "TBL_NOTE";

  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    const dbName = "Notes.db";
    final path = join(dbPath, dbName);
    _database = await openDatabase(path, version: 1, onCreate: _createDb);
    return _database!;
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $_tableName ( id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, creationTime TEXT )");
  }

  Future<void> insertNote(Note note) async {
    final db = await database;
    await db.insert("$_tableName", note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteNote(Note note) async {
    final db = await database;
    await db.delete(
      "$_tableName",
      where: "id==?",
      whereArgs: [note.id],
    );
  }

  Future<List<Note>> getNoteList() async {
    final db = await database;
    List<Map<String, dynamic>> items =
        await db.query("$_tableName", orderBy: "id DESC");

    return List.generate(
      items.length,
      (i) => Note(
        id: items[i]["id"],
        content: items[i]["content"],
        creationTime: DateTime.parse(items[i]["creationTime"]),
      ),
    );
  }
}
