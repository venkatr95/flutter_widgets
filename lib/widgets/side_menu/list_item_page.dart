import 'package:flutter/material.dart';

class ListItemPage extends StatelessWidget {
  final String itemTitle;

  const ListItemPage(this.itemTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "$itemTitle Page",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}