import 'package:cookingapp/category_item.dart';
import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cooking master'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        children: DUMMY_CATEGORIES
            .map((cat) => CategoryItem(cat.id,cat.title, cat.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
