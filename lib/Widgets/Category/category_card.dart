import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Grid Card Clicked');
      },
      child: Card(
        elevation: 2,
        color: Colors.grey[100],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
           Column(
             children: const [
               Padding(
                 padding: EdgeInsets.only(top : 20.0,left : 25.0),
                 child: Text('Home',style: TextStyle(fontSize: 30,color: Colors.purple,fontWeight: FontWeight.bold),),
               ),
               Text('To-Do(0)'),
             ],
           ),
            Padding(
              padding: const EdgeInsets.only(left : 200.0),
              child: const Icon(Icons.home),
            )
          ],
        ),
      ),
    );
  }
}
