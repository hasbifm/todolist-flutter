import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/provider/todos.dart';
import 'package:todolist/widget/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, @required this.todo}) : super(key: key);
  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String title;
  String desc;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    title = widget.todo.todoTitle;
    desc = widget.todo.todoDesc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Todo"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final provider =
                  Provider.of<TodosProvider>(context, listen: false);
              provider.removeTodo(widget.todo);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: TodoFormWidget(
            todoTitle: title,
            todoDesc: desc,
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDesc: (desc) => setState(() => this.desc = desc),
            onSavedTodo: saveTodo,
            oncancel: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formkey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, desc);
      Navigator.of(context).pop();
    }
  }
}
