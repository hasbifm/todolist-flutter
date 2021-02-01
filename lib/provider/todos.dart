import 'package:flutter/material.dart';
import 'package:todolist/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), todoTitle: "Olahraga"),
    Todo(createdTime: DateTime.now(), todoTitle: "Makan"),
    Todo(createdTime: DateTime.now(), todoTitle: "Olahraga", todoDesc: "lari"),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
}
