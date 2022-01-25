import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grid_todo/Models/category.dart';
import 'package:grid_todo/Providers/shared_preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryProvider extends ChangeNotifier {
  SharedPreferences? sharedPreferences;
  List<Category> categories = [
    Category("Home"),
    Category("School"),
    Category("Personal"),
    Category("Work"),
    Category("Flutter"),
  ];

  UnmodifiableListView<Category> get allCategories =>
      UnmodifiableListView(categories);

  // Category Methods
  void addCategory(Category category) {
    categories.add(category);
    updateCategoryToLocalStorage();
    notifyListeners();
  }

  // Shared Preferences Methods
  void initSharedPreferences() async {
    // sharedPreferences = await SharedPreferences.getInstance();
    await SharedPreferencesHelper.init();
    sharedPreferences = SharedPreferencesHelper.instance;
    loadCategoryFromLocalStorage();
    notifyListeners();
  }

  void saveCategoryToLocalStorage() {
    List<String>? spList =
        categories.map((category) => json.encode(category.toJson())).toList();
    sharedPreferences!.setStringList('categorylist', spList);
  }

  void loadCategoryFromLocalStorage() {
    List<String>? spList = sharedPreferences!.getStringList('categorylist');
    if (spList != null) {
      categories =
          spList.map((item) => Category.fromMap(json.decode(item))).toList();
    }
  }

  void updateCategoryToLocalStorage() {
    List<String>? spList =
        categories.map((item) => json.encode(item.toJson())).toList();
    sharedPreferences?.remove('categorylist');
    sharedPreferences!.setStringList('categorylist', spList);
  }
}
