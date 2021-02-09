import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/api/firebase_api.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/utils.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<Todo> _todos = List<Todo>();

  List<Todo> get _todosOngoing =>
      _todos.where((element) => element.isDone == false).toList();

  List<Todo> get _todosCompleted =>
      _todos.where((element) => element.isDone).toList();

  TodoBloc() : super(TodoInitial());

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
//ShowTodo
    if (event is EventShowTodo) {
      yield StateShowTodo(_todosOngoing);
    }
//ShowCompleted
    else if (event is EventShowTodoComplete) {
      yield StateShowCompleteTodo(_todosCompleted);
    }
//AddTodo
    else if (event is EventAddTodo) {
      // _todos.add(event.todo);
      FirebaseAPI.createTodo(event.todo);

      if (state is StateShowTodo) {
        yield StateShowTodo(_todosOngoing);
      } else if (state is StateShowCompleteTodo) {
        yield StateShowCompleteTodo(_todosCompleted);
      }
    }
//DeleteTodo
    else if (event is EventDeleteTodo) {
      // _todos.remove(event.todo);
      FirebaseAPI.deleteTodo(event.todo);
      if (state is StateShowTodo) {
        yield StateShowTodo(_todosOngoing);
      } else if (state is StateShowCompleteTodo) {
        yield StateShowCompleteTodo(_todosCompleted);
      }
    }
//EditTodo
    else if (event is EventEditTodo) {
      event.todo.todoTitle = event.title;
      event.todo.todoDesc = event.desc;

      FirebaseAPI.updateTodo(event.todo);

      if (state is StateShowTodo) {
        yield StateShowTodo(_todosOngoing);
      } else if (state is StateShowCompleteTodo) {
        yield StateShowCompleteTodo(_todosCompleted);
      }
    }
//ToogleComplete
    else if (event is EventToogleComplete) {
      event.todo.isDone = !event.todo.isDone;

      FirebaseAPI.updateTodo(event.todo);

      if (state is StateShowTodo) {
        yield StateShowTodo(_todosOngoing);
        Utils.showSnackbar(event.context, "Todo Completed");
      } else if (state is StateShowCompleteTodo) {
        yield StateShowCompleteTodo(_todosCompleted);
        Utils.showSnackbar(event.context, "Todo Uncompleted");
      }
    }
//SetTodo
    else if (event is EventSetTodos) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _todos = event.todos;
      });
      _todos = event.todos;
      if (state is StateShowTodo) {
        yield StateShowTodo(_todosOngoing);
      } else if (state is StateShowCompleteTodo) {
        yield StateShowCompleteTodo(_todosCompleted);
      }
    }
  }
}
