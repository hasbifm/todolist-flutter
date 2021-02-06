part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class EventAddTodo extends TodoEvent {
  final Todo todo;

  EventAddTodo(this.todo);
}

class EventDeleteTodo extends TodoEvent {
  final Todo todo;

  EventDeleteTodo(this.todo);
}

class EventEditTodo extends TodoEvent {
  final Todo todo;
  final String title;
  final String desc;

  EventEditTodo(this.todo, this.title, this.desc);
}

class EventToogleComplete extends TodoEvent {
  final Todo todo;

  EventToogleComplete(this.todo);
}

class EventShowTodo implements TodoEvent {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class EventShowTodoComplete implements TodoEvent {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}
