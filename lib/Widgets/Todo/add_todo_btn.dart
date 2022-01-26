import 'package:flutter/material.dart';
import 'package:grid_todo/Models/todo.dart';
import 'package:grid_todo/Providers/todo_provider.dart';
import 'package:provider/provider.dart';

class AddTodoBTN extends StatelessWidget {
  AddTodoBTN({Key? key,required this.title}) : super(key: key);
  String title;
  var titleControl = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, state,child) {
        return ElevatedButton(onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: AlertDialog(
                    title: const Text('Add Todo'),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: titleControl,
                              validator: (value) {
                                if(value == '') {
                                  return 'Title cant be empty';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(border: OutlineInputBorder(),labelText: 'Title', ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            bool validResult = formKey.currentState!.validate();
                            if (validResult == true) {
                                Todo todo =
                                Todo(titleControl.text, title);
                                Provider.of<TodoProvider>(context,listen: false).addTodo(todo);
                                titleControl.text = '';
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
                  ),
                );
              });
        }, child: Text('Add Todo'));
      }
    );
  }
}
