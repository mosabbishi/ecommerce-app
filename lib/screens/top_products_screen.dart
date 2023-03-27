import 'package:ecommerce_app/consts/text_const.dart';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/widgets/products_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class TopProductsScreen extends StatelessWidget {
  const TopProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconlyLight.arrowLeft2),
          color: Colors.black,
        ),
        title: Text(
          'Top Products',
          style: headlineStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          var prod = productsList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductsBox(
              image: prod.image,
              title: prod.title,
              price: prod.price,
              isTop: prod.isTopProducts = true,
              function: () {},
            ),
          );
        },
      ),
    );
  }
}
