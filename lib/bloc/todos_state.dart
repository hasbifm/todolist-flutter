part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial implements TodosState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class TodosStateComplete implements TodosState {
  final List<Todo> completedTodos;

  TodosStateComplete(this.completedTodos);
  @override
  List<Object> get props => [completedTodos];

  @override
  bool get stringify => false;
}
