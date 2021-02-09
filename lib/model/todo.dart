import 'package:flutter/material.dart';
import 'package:todolist/utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String todoId;
  String todoTitle;
  String todoDesc;
  bool isDone;

  Todo({
    @required this.createdTime,
    @required this.todoTitle,
    this.todoId,
    this.todoDesc = "",
    this.isDone = false,
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
      createdTime: Utils.toDateTime(json['createdTime']),
      todoTitle: json['title'],
      todoDesc: json['description'],
      todoId: json['id'],
      isDone: json['isDone']);

  Map<String, dynamic> toJson() => {
        "createdTime": Utils.fromDateTimeToJson(createdTime),
        "title": todoTitle,
        "description": todoDesc,
        "id": todoId,
        "isDone": isDone,
      };
}
