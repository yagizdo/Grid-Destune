import 'package:flutter/material.dart';
import 'package:grid_todo/Models/category.dart';
import 'package:grid_todo/Providers/category_provider.dart';
import 'package:grid_todo/Widgets/Category/category_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var formKey = GlobalKey<FormState>();
  var categorynameControl = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add Category'),
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: categorynameControl,
                        validator: (value) {
                          if (value == '') {
                            return 'Category name cant be empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Category Name',
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          bool validResult = formKey.currentState!.validate();
                          if (validResult == true) {
                            Category category =
                                Category(categorynameControl.text);
                            Provider.of<CategoryProvider>(context,
                                    listen: false)
                                .addCategory(category);
                            categorynameControl.text = '';
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Add')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const CategoryList(),
    );
  }
}
