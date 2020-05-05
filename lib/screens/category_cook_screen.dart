import '../widgets/cook_item.dart';

import '../dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryCookScreen extends StatelessWidget {
  static const categoryRouteName = '/categories-cook';

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];
    final categoryRecipe = DUMMY_RECEPIE.where((recep) {
      return recep.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return CookItem(
              title: categoryRecipe[index].title,
              imageUrl: categoryRecipe[index].imageUrl,
              duration: categoryRecipe[index].duration,
              affordability: categoryRecipe[index].affordability,
              complexity: categoryRecipe[index].complexity,
            );
          },
          itemCount: categoryRecipe.length,
        ));
  }
}