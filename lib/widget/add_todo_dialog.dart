import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/widget/todo_form_widget.dart';

class AddTodoDialog extends StatefulWidget {
  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final _formKey = GlobalKey<FormState>();
  String todoTitle = "";
  String todoDesc = "";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add Todo"),
            TodoFormWidget(
              onChangedTitle: (inputTitle) =>
                  setState(() => this.todoTitle = inputTitle),
              onChangedDesc: (inputDesc) =>
                  setState(() => this.todoDesc = inputDesc),
              onSavedTodo: () => addTodo(context),
              oncancel: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void addTodo(context) {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        createdTime: DateTime.now(),
        todoTitle: todoTitle,
        todoDesc: todoDesc,
      );
      BlocProvider.of<TodoBloc>(context).add(EventAddTodo(todo));
      Navigator.of(context).pop();
    }
  }
}
