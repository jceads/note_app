import 'package:flutter/material.dart';

class Note {
  int? id;
  final String content;
  DateTime creationTime;
  Note({
    this.id,
    required this.content,
    required this.creationTime,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "content": content,
      "creationTime": creationTime.toString(),
    };
  }

  String toString() {
    return "Note(id:$id, content: $content, creationTime: $creationTime)";
  }
}
