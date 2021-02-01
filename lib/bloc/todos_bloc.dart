import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/model/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  List<Todo> _completedTodos = List();

  TodosBloc() : super(TodosInitial());

  @override
  Stream<TodosState> mapEventToState(
    TodosEvent event,
  ) async* {
    if (event is TodosEventIsComplete) {
      yield* _todosIsComplete(event.todo);
    } else if (event is TodosEventShowCompleted) {
      yield* _showCompleted();
    }
  }

  Stream<TodosState> _todosIsComplete(Todo cTodo) async* {
    _completedTodos.add(cTodo);
  }

  Stream<TodosState> _showCompleted() async* {
    yield (TodosStateComplete(_completedTodos));
  }
}
