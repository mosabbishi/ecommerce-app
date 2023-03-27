import 'package:flutter/material.dart';

class InnerCategoriesScreen extends StatelessWidget {
  final String title;
  InnerCategoriesScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title),
          ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
