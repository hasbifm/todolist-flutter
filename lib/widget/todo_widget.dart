import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/page/edit_todo_page.dart';
import 'package:todolist/provider/todos.dart';
import 'package:todolist/utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({Key key, this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // borderRadius: BorderRadius.circular(8),
      child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.2,
          key: Key(todo.todoId),
          actions: [
            IconSlideAction(
              color: Colors.greenAccent,
              onTap: () => {
                editTodo(context, todo),
              },
              caption: "Edit",
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.redAccent,
              onTap: () => {
                deleteTodo(context, todo),
              },
              caption: "Delete",
              icon: Icons.delete,
            )
          ],
          child: buildTodo(context)),
    );
  }

  Widget buildTodo(BuildContext context) {
    return GestureDetector(
      onTap: () => editTodo(context, todo),
      child: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
              value: todo.isDone,
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              onChanged: (_) {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                final isDone = provider.toggleTodoStatus(todo);

                Utils.showSnackbar(context,
                    isDone ? "Task Completed" : "Task marked incomplete");
              },
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.todoTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  if (todo.todoDesc.isNotEmpty)
                    Container(
                      child: Text(
                        todo.todoDesc,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackbar(context, "Deleted the task");
  }

  editTodo(BuildContext context, Todo todo) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditTodoPage(todo: todo),
      ),
    );
  }
}
