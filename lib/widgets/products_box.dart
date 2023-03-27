import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductsBox extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final Function() function;
  bool isTop;

  ProductsBox({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.function,
    required this.isTop,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height * 0.2,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
              spreadRadius: 2.0,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            // image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Image.asset(image),
            ),
            // title and rating
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '$price \$',
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // price and add to cart
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: const [
                      Text('/5'),
                      Icon(IconlyLight.buy),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
