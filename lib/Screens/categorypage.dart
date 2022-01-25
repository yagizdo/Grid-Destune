import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Your Tasks'),
          ListView.builder(
              itemBuilder: (context,index) {
                return Card();
              }
          )
        ],
      ),
    );
  }
}
