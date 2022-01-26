import 'package:flutter/material.dart';
import 'package:grid_todo/Models/category.dart';
import 'package:grid_todo/Providers/category_provider.dart';
import 'package:grid_todo/Widgets/Category/category_card.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, state,child) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2
            ),
            itemCount: state.allCategories.length,
            itemBuilder: (context,index) {
              return Padding(
                padding: const EdgeInsets.only(top : 20.0,right: 10.0),
                child: CategoryCard(category: state.allCategories[index],),
              );
            }
        );
      }
    );
  }
}
