import 'package:flutter/material.dart';

class CookDetailScreen extends StatelessWidget {
  static const routeName = '/recipe-detail';

  @override
  Widget build(BuildContext context) {
    final cookId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$cookId'),
      ),
      body: Center(
        child: Text('The recipe detail page - $cookId!'),
      ),
    );
  }
}
