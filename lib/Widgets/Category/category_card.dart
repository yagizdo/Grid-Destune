import 'package:flutter/material.dart';
import 'package:grid_todo/Models/category.dart';
import 'package:grid_todo/Screens/categorypage.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  final Category category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(context: context, builder: (context) => CategoryPage(title: category.title));
        print('Grid Card Clicked');
      },
      child: Card(
        elevation: 2,
        color: Colors.grey[100],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(top : 20.0,left : 25.0),
                 child: Text(category.title,style: TextStyle(fontSize: 30,color: Colors.purple,fontWeight: FontWeight.bold),),
               ),
               const Text('To-Do(0)'),
             ],
           ),
          ],
        ),
      ),
    );
  }
}
