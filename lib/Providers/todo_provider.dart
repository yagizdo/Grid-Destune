import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grid_todo/Models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [
    Todo('Home','Home'),
    Todo('Home 2','Home'),
    Todo('School','School'),
    Todo('School second todo','School'),
    Todo('Personal','Personal'),
    Todo('Work','Work'),
    Todo('Flutter','Flutter'),
  ];

  UnmodifiableListView<Todo> get allTodos =>
      UnmodifiableListView(todos);
}