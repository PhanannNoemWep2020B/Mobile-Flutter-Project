import 'package:flutter/material.dart';
import 'Todo.dart';

typedef ToggleTodoCallback = void Function(String, bool);
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [];
  TextEditingController controller = new TextEditingController();

  _toggleTodo(Todo todo, bool isChecked){
    setState(() {
     todo.isDone = isChecked; 
    });
  }

  // Widget _buildItem(BuildContext context, index){
  //   final todo = todos[index];
  //  return CheckboxListTile(
  //    value: todo.isDone,
  //    title: Text(todo.title),
  //    onChanged: (bool isChecked){
  //      _toggleTodo(todo, isChecked);
  //    },
  //  );
  // }

  createAlert() async{
    await showDialog<Todo>(
        context: context,
        builder: (BuildContext context) {
          var text2 = Text("New todo", textAlign: TextAlign.center);
          return AlertDialog(
            title: text2,
            content: TextField(
              //
              controller: controller,
              autofocus: true,
              //
              decoration: InputDecoration(
                hintText: "Add something.......",
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Add'),
                onPressed: () {
                  setState(() {
                    final todo = new Todo(title: controller.value.text);
                    if(controller.value.text == ""){
                      print("");
                    }else{
                    todos.add(todo); 
                    }
                    controller.clear();
                    Navigator.of(context).pop();
                  });
                },
              ),
            ],
          );
        });
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          createAlert();
        },
      ),
    );
  }
  //void onTodoToggle(Todo todo, bool isChecked) {}
}
//============================================
//cmd with your location
//flutter build apk