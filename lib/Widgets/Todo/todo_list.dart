import 'package:flutter/material.dart';
import 'package:grid_todo/Models/todo.dart';
import 'package:grid_todo/Providers/todo_provider.dart';
import 'package:grid_todo/Widgets/Todo/todo_card.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key,required this.title}) : super(key: key);

  String title;
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, state,child) {
            return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.allTodos.where((Todo) => Todo.category.contains(title)).length,
            itemBuilder: (context,index) {
              return TodoCard(todo : state.allTodos.where((Todo) => Todo.category.contains(title)).toList()[index]);
            }
        );
      }
    );
  }
}
