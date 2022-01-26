import 'package:flutter/material.dart';
import 'package:grid_todo/Models/todo.dart';

class TodoCard extends StatelessWidget {
  TodoCard({Key? key,required this.todo}) : super(key: key);

  Todo todo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 11,
        child: Card(
          child: Column(
            children: [
              Text(todo.title),
            ],
          ),
        ),
      ),
    );;
  }
}
