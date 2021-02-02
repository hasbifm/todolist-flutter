import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/todos.dart';
import 'package:todolist/widget/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;

    return todos.isEmpty
        ? Center(
            child: Text(
              "No Completed Todos",
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            itemCount: todos.length,
            separatorBuilder: (BuildContext context, int index) {
              return Container(height: 8);
            },
          );
  }
}
