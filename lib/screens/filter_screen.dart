import '../widgets/drawer_content.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters );

  @override
  _FiltersScreen createState() => _FiltersScreen();
}

class _FiltersScreen extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;


  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree= widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buidSwitchListTile(String title, String subtitle, var currentValue,
      Function switchHanler) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: switchHanler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed:()
          {final selectedFilters ={
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian
          };
            widget.saveFilters(selectedFilters);}),
        ],
      ),
      drawer: DrawerContent(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust meal selection',
              style: Theme
                  .of(context)
                  .textTheme
                  .subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buidSwitchListTile(
                    'Glutten-free', 'Only gluten-free meals!', _glutenFree,
                        (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                _buidSwitchListTile(
                    'Lactose-free', 'Only lactose-free meals!', _lactoseFree,
                        (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                _buidSwitchListTile(
                    'Vegetarian', 'Only vegetarian meals!', _vegetarian,
                        (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                _buidSwitchListTile('Vegan', 'Only vegean meals!', _vegan,
                        (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
