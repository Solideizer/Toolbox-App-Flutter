import 'package:flutter/material.dart';
import 'package:flutter_toolbox/addTodoDialog.dart';
import 'package:flutter_toolbox/todo.dart';
import 'package:flutter_toolbox/todoListWidget.dart';
import 'package:flutter_toolbox/todos.dart';
import 'package:provider/provider.dart';

import 'completedListWidget.dart';
import 'firebaseApi.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text("Todo"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: (index) => setState(
          () {
            selectedIndex = index;
          },
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: "Todos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_outline, size: 28.0),
            label: "Completed",
          ),
        ],
      ),
      body: StreamBuilder<List<Todo>>(
          stream: FirebaseApi.readTodo(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final todos = snapshot.data;
                final provider = Provider.of<TodosProvider>(context);
                provider.setTodos(todos);
                return tabs[selectedIndex];
            }
          }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          child: AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
