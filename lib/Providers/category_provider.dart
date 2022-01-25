import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grid_todo/Models/category.dart';

class CategoryProvider extends ChangeNotifier {
List<Category> categories = [
  Category("Home"),
  Category("School"),
  Category("Personal"),
  Category("Work"),
  Category("Flutter"),
];

UnmodifiableListView<Category> get allCategories => UnmodifiableListView(categories);

void addCategory(Category category) {
  categories.add(category);
  notifyListeners();
}
}