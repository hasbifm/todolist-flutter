import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/model/todo.dart';

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
    if (event is EventShowTodo) {
      yield StateShowTodo(_todosOngoing);
    } else if (event is EventShowTodoComplete) {
      yield StateShowCompleteTodo(_todosCompleted);
    } else if (event is EventAddTodo) {
      _todos.add(event.todo);
      yield StateShowTodo(_todosOngoing);
    } else if (event is EventDeleteTodo) {
      _todos.remove(event.todo);
      yield StateShowTodo(_todosOngoing);
    } else if (event is EventEditTodo) {
      event.todo.todoTitle = event.title;
      event.todo.todoDesc = event.desc;
      yield StateShowTodo(_todosOngoing);
    } else if (event is EventToogleComplete) {
      event.todo.isDone = !event.todo.isDone;
      if (state is StateShowTodo) {
        yield StateShowTodo(_todosOngoing);
      } else if (state is StateShowCompleteTodo) {
        yield StateShowTodo(_todosCompleted);
      }
    }
  }
}
