import 'package:flutter/material.dart';
import 'package:widget_app_structure/module12/todos/add_new_todo.dart';
import 'package:widget_app_structure/module12/todos/todo_data.dart';

class ToDosApp extends StatefulWidget {
  const ToDosApp({super.key});

  @override
  State<ToDosApp> createState() => _ToDosAppState();
}

class _ToDosAppState extends State<ToDosApp> {
  List<TodoData> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              setState(() {
                todos.removeAt(index);
              });
            },
            leading: Icon(Icons.task),
            title: Text(todos[index].title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todos[index].description),
                Text('${todos[index].dueDate}'),
              ],
            ),
            trailing: Text(todos[index].status),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TodoData? todo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewTodo()),
          );
          if (todo != null) {
            setState(() {
              todos.add(todo);
            });
          }
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
