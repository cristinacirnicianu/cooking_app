import '../screens/filter_screen.dart';
import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(title, style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme
                .of(context)
                .accentColor,
            child: Text('Cooking someting!', style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme
                    .of(context)
                    .primaryColor
            )),
          ),
          SizedBox(),
          buildListTile(
              'Meals',
              Icons.restaurant,
              () {
                Navigator.of(context).pushNamed('/');
              }
          ),
          buildListTile(
              'Filters',
              Icons.settings,
                  () {
                Navigator.of(context).pushNamed(FiltersScreen.routeName);
                  }),
        ],
      ),
    );
  }
}
