import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String todoTitle;
  final String todoDesc;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDesc;
  final VoidCallback onSavedTodo;
  final VoidCallback oncancel;

  const TodoFormWidget({
    Key key,
    this.todoTitle = "",
    this.todoDesc = "",
    @required this.onChangedTitle,
    @required this.onChangedDesc,
    @required this.onSavedTodo,
    @required this.oncancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTitle(),
          buildDesc(),
          SizedBox(height: 10.0),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return TextFormField(
      initialValue: todoTitle,
      validator: (title) {
        if (title.isEmpty) {
          return "The title can't be empty";
        } else {
          return null;
        }
      },
      onChanged: onChangedTitle,
      maxLines: 1,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Title',
      ),
    );
  }

  Widget buildDesc() {
    return TextFormField(
      initialValue: todoDesc,
      validator: (title) {
        if (title.isEmpty) {
          return "The description can't be empty";
        } else {
          return null;
        }
      },
      onChanged: onChangedDesc,
      maxLines: 3,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Description',
      ),
    );
  }

  Widget buildButton() {
    return Table(
      columnWidths: {1: FlexColumnWidth(0.3)},
      children: [
        TableRow(
          children: [
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              onPressed: onSavedTodo,
              color: Colors.blueAccent,
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              onPressed: oncancel,
              color: Colors.black,
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
