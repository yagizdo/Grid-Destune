import 'package:flutter/material.dart';
import 'package:grid_todo/Models/todo.dart';
import 'package:grid_todo/Providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoCard extends StatelessWidget {
  TodoCard({Key? key,required this.todo}) : super(key: key);

  Todo todo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 9,
        child: Card(
          child: Column(
            children: [
              Consumer<TodoProvider>(
                builder: (context, state,child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(todo.title),
                      IconButton(icon : Icon(Icons.delete_forever),onPressed: () {
                        state.removeTodo(todo);
                      },)
                    ],
                  );
                }
              )
            ],
          ),
        ),
      ),
    );;
  }
}
