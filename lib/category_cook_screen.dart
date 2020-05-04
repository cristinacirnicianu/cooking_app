import 'package:flutter/material.dart';

class CategoryCookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: Center(
        child: Text('The recepies for category!'),
      ),
    );
  }
}
