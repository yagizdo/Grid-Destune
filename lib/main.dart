import 'package:flutter/material.dart';
import 'package:grid_todo/Providers/category_provider.dart';
import 'package:grid_todo/Providers/todo_provider.dart';
import 'package:grid_todo/Screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
            create: (BuildContext context) => CategoryProvider()),
        ChangeNotifierProvider<TodoProvider>(
            create: (BuildContext context) => TodoProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Grid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
