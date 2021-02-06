part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class StateShowTodo implements TodoState {
  final List<Todo> todos;
  List<Todo> get todosOngoing =>
      todos.where((element) => element.isDone == false).toList();

  StateShowTodo(this.todos);

  @override
  List<Object> get props => [todosOngoing];

  @override
  bool get stringify => throw UnimplementedError();
}

class StateShowCompleteTodo implements TodoState {
  final List<Todo> todos;

  StateShowCompleteTodo(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  bool get stringify => throw UnimplementedError();
}
