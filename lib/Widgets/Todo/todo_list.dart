import 'package:flutter/material.dart';
import 'package:grid_todo/Widgets/Todo/todo_card.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context,index) {
          return TodoCard();
        }
    );
  }
}
