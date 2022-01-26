import 'package:flutter/material.dart';
import 'package:grid_todo/Widgets/Todo/todo_card.dart';
import 'package:grid_todo/Widgets/Todo/todo_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top : 20.0),
                child: Text('Your Tasks',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 30),),
              ),
              TodoList(title: title,),
            ],
          ),
        ),
      );
  }
}
