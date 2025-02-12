import 'package:flutter/material.dart';
import 'package:todolist/widget/add_todo_dialog.dart';
import 'package:todolist/widget/completed_list_widget.dart';
import 'package:todolist/widget/todolist_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      ToDoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: tabs[selectedIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          child: AddTodoDialog(),
          barrierDismissible: false,
        ),
        tooltip: 'Create new todo',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black38,
        currentIndex: selectedIndex,
        onTap: (index) => setState(
          () {
            selectedIndex = index;
          },
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Todos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check_sharp),
            label: "Completed",
          ),
        ],
      ),
    );
  }
}
