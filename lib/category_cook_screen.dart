import 'package:flutter/material.dart';

class CategoryCookScreen extends StatelessWidget {
  static const categoryRouteName = '/categories-cook';
  @override
  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('The recepies for category!'),
      ),
    );
  }
}
