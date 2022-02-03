import 'package:flutter/material.dart';
import 'package:grid_todo/Models/category.dart';
import 'package:grid_todo/Providers/category_provider.dart';
import 'package:grid_todo/Providers/todo_provider.dart';
import 'package:grid_todo/Screens/categorypage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  final Category category;
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
        builder: (context,state,child) => GestureDetector(
          onTap: () {
            showMaterialModalBottomSheet(
                context: context, builder: (context) => CategoryPage(title: category.title));
            print('Grid Card Clicked');
          },
          onLongPress: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Are you sure?'),
                    content: const Text('You do realize that incomplete todos will also be deleted, right?'),
                    actions: [
                      ElevatedButton(onPressed: () {
                        state.removeCategory(category);
                        Navigator.pop(context);
                      }, child: Text('I am sure'),style: ElevatedButton.styleFrom(primary: Colors.red),),
                      TextButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text('Cancel'))
                    ],
                  );
                }
            );
          },
          child: Card(
            elevation: 2,
            color: Colors.grey[100],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top : 30.0, left : 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(category.title,style: TextStyle(fontSize: 30,color: Colors.purple,fontWeight: FontWeight.bold),),
                     Consumer<TodoProvider>(
                       builder: (context, state,child) {
                         return Text('To-Do(${state.allTodos.where((Todo) => Todo.category.contains(category.title)).length})');
                       }
                     ),
                   ],
                 ),
                ],
              ),
            ),
          ),
        )
    );
      }
  }



