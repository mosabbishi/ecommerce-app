import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/inner_categories_screen.dart';

class CategoryBox extends StatelessWidget {
  final String image;
  final String title;
  final Function() function;
  const CategoryBox({super.key, required this.image, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            height: size.height * 0.1,
            width: size.width * 0.24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
