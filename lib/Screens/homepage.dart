import 'package:flutter/material.dart';
import 'package:grid_todo/Providers/category_provider.dart';
import 'package:grid_todo/Widgets/Category/category_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false)
        .initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoryList(),
    );
  }
}
