import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grid_todo/Models/todo.dart';
import 'package:grid_todo/Providers/shared_preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoProvider extends ChangeNotifier {
  SharedPreferences? sharedPreferences;
  var todos = <Todo>[];

  UnmodifiableListView<Todo> get allTodos =>
      UnmodifiableListView(todos);

  void addTodo(Todo todo) {
    todos.add(todo);
    Fluttertoast.showToast(
        msg: 'Added!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    notifyListeners();
    saveDataToLocalStorage();
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
    Fluttertoast.showToast(
        msg: 'Removed!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    notifyListeners();
    updateDataToLocalStorage();
  }

  // methods for shared preferences
  void initSharedPreferences() async {
    // sharedPreferences = await SharedPreferences.getInstance();
    await SharedPreferencesHelper.init();
    sharedPreferences = SharedPreferencesHelper.instance;
    loadDataFromLocalStorage();
    notifyListeners();
  }

  // Save Data - Shared Preferences
  void saveDataToLocalStorage() {
    List<String>? spList = todos.map((item) => json.encode(item.toJson())).toList();
    sharedPreferences?.setStringList('list',spList);
    print('Saved!');
  }

  void loadDataFromLocalStorage() {
    List<String>? spList = sharedPreferences!.getStringList('list');
    if (spList != null) {
      todos = spList.map((item) => Todo.fromMap(json.decode(item))).toList();
    }
  }

  void updateDataToLocalStorage() {
    List<String>? spList =
    todos.map((item) => json.encode(item.toJson())).toList();
    sharedPreferences?.remove('list');
    sharedPreferences!.setStringList('list', spList);
  }

}