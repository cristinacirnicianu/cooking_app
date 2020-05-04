import 'package:flutter/material.dart';

class CategoryCookScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryCookScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
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
