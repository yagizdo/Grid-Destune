import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/category.dart';
import '../../Providers/category_provider.dart';

class AddCategoryBtn extends StatelessWidget {
  const AddCategoryBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var categorynameControl = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      child: GestureDetector(
          onTap: () {
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
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Icon(Icons.add),
          )),
    );
  }
}
