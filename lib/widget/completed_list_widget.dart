import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/widget/todo_widget.dart';

class CompletedListWidget extends StatefulWidget {
  @override
  _CompletedListWidgetState createState() => _CompletedListWidgetState();
}

class _CompletedListWidgetState extends State<CompletedListWidget> {
  TodoBloc _todoBloc;

  @override
  void initState() {
    _todoBloc = BlocProvider.of<TodoBloc>(context);
    _todoBloc.add(EventShowTodoComplete());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      cubit: _todoBloc,
      builder: (context, state) {
        if (state is StateShowCompleteTodo) {
          if (state.todos.isEmpty) {
            return Center(
              child: Text(
                "No Completed Todos",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return TodoWidget(todo: todo);
              },
              padding: EdgeInsets.all(20),
              physics: BouncingScrollPhysics(),
              itemCount: state.todos.length,
              separatorBuilder: (BuildContext context, int index) {
                return Container(height: 8);
              },
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      listener: (context, state) => {},
    );
  }
}
