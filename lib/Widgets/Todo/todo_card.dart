import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 11,
        child: Card(
          child: Column(
            children: [
              Text('Test'),
            ],
          ),
        ),
      ),
    );;
  }
}
