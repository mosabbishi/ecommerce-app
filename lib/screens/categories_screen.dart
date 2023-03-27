import 'package:ecommerce_app/consts/images_consts.dart';
import 'package:ecommerce_app/consts/text_const.dart';
import 'package:flutter/material.dart';

import '../widgets/category_box.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Categories',
          style: headlineStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // mainAxisExtent: 120,
          childAspectRatio: 1 / 1,
          mainAxisExtent: 140,
          crossAxisCount: 3,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            child: CategoryBox(
              title: images[index][1],
              image: images[index][0],
              
            ),
          );
        },
      ),
    );
  }
}
