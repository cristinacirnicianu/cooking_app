import 'package:cookingapp/dummy_data.dart';
import 'package:flutter/material.dart';

class CookDetailScreen extends StatelessWidget {
  static const routeName = '/recipe-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cookId = ModalRoute.of(context).settings.arguments as String;
    final selectedRecipe =
        DUMMY_RECEPIE.firstWhere((recep) => recep.id == cookId);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedRecipe.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedRecipe.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(selectedRecipe.ingredients[index]),
                        ),
                      );
                    },
                    itemCount: selectedRecipe.ingredients.length),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(
                          selectedRecipe.steps[index],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectedRecipe.steps.length,
                ),
              )
            ],
          ),
        ));
  }
}
