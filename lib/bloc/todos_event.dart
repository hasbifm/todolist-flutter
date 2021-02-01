part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosEventIsComplete implements TodosEvent {
  final Todo todo;

  TodosEventIsComplete(this.todo);
  @override
  List<Object> get props => [todo];

  @override
  bool get stringify => false;
}

class TodosEventShowCompleted implements TodosEvent {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}
