import 'package:flutter/material.dart';
import 'package:grid_todo/Providers/category_provider.dart';
import 'package:grid_todo/Screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider<CategoryProvider>(
        create: (BuildContext context) => CategoryProvider(),
          child : const MyApp(),
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
