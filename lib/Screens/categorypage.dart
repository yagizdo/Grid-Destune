import 'package:flutter/material.dart';
import 'package:grid_todo/Providers/todo_provider.dart';
import 'package:grid_todo/Widgets/Todo/add_todo_btn.dart';
import 'package:grid_todo/Widgets/Todo/todo_list.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context,listen: false).initSharedPreferences();
  }
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
            TodoList(title: widget.title),
            AddTodoBTN(title: widget.title,),
          ],
        ),
      ),
    );
  }
}
