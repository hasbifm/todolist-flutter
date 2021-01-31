import 'package:flutter/material.dart';
import 'package:todolist/todo_form_widget.dart';

class AddTodoDialog extends StatefulWidget {
  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  @override
  final _todoKey = GlobalKey<FormState>();
  String todoTitle = "";
  String todoDesc = "";

  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Add Todo"),
          TodoFormWidget(
            onChangedTitle: (inputTitle) =>
                setState(() => this.todoTitle = inputTitle),
            onChangedDesc: (inputDesc) =>
                setState(() => this.todoDesc = inputDesc),
            onSavedTodo: () {},
            oncancel: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
