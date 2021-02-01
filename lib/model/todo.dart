import 'package:flutter/material.dart';

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
}
