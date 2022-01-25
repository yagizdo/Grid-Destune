import 'package:flutter/material.dart';
import 'package:grid_todo/Widgets/Category/category_card.dart';
import 'package:grid_todo/Widgets/Homepage/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: CategoryList(),
    );
  }
}
