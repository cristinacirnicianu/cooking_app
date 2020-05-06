import '../widgets/cook_item.dart';

import '../dummy_data.dart';
import '../models/recipe.dart';
import 'package:flutter/material.dart';

class CategoryCookScreen extends StatefulWidget {
  static const categoryRouteName = '/categories-cook';

  @override
  _CategoryCookScreen createState() => _CategoryCookScreen();
}

class _CategoryCookScreen extends State<CategoryCookScreen> {
  String categoryTitle;
  List<Recepie> displayedRecipe;
  var _loadInitData = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadInitData) {
      final routArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routArgs['title'];
      final categoryId = routArgs['id'];
      displayedRecipe = DUMMY_RECEPIE.where((recep) {
        return recep.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();

  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedRecipe.removeWhere((meal) =>meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return CookItem(
              id: displayedRecipe[index].id,
              title: displayedRecipe[index].title,
              imageUrl: displayedRecipe[index].imageUrl,
              duration: displayedRecipe[index].duration,
              affordability: displayedRecipe[index].affordability,
              complexity: displayedRecipe[index].complexity,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedRecipe.length,
        ));
  }
}
