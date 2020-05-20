import 'package:flutter/material.dart';
import 'package:fruit_ui/widget/categories.dart';
import 'package:fruit_ui/widget/new_items.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              "All Fruits",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          Categories(),
          NewItems()
        ],
      ),
    );
  }
}
