import 'package:ecommerce_app/consts/text_const.dart';
import 'package:ecommerce_app/consts/themes_const.dart';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class DetailsScreen extends StatefulWidget {
  Products products;
  DetailsScreen({super.key, required this.products});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List sizes = ['S', 'M', 'L', 'XL'];

  bool isSelected = false;
  bool isFavourite = false;

  void addToFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  void changeSize(index) {}

  int count = 1;
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    if (count < 1) {
      return;
    }
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // image and back button
            Stack(
              children: [
                Image.asset(widget.products.image),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        IconlyLight.arrowLeftCircle,
                        color: Colors.white,
                        size: 33,
                      ),
                    ),
                    IconButton(
                        onPressed: addToFavourite,
                        icon: isFavourite
                            ? const Icon(
                                IconlyBold.heart,
                                color: Colors.red,
                                size: 33,
                              )
                            : const Icon(
                                IconlyLight.heart,
                                color: Colors.white,
                                size: 33,
                              )),
                  ],
                ),
              ],
            ),
            // content
            Expanded(
              child: Container(
                width: double.infinity,
                // height: size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title and rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.products.title,
                            style: headlineStyle,
                          ),
                          const Text('ratings / 5'),
                        ],
                      ),
                      // category
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.products.category,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${widget.products.price} \$',
                            style: const TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                      //
                      const Divider(),
                      Text(widget.products.description),
                      // sizes for clothes and shoes

                      //
                      const Spacer(),
                      // quanity
                      Row(
                        children: [
                          FloatingActionButton(
                            backgroundColor: amber,
                            elevation: 0.0,
                            onPressed: () => decrement(),
                            child: const Icon(Icons.remove),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text('$count'),
                          ),
                          FloatingActionButton(
                            backgroundColor: amber,
                            elevation: 0.0,
                            onPressed: () => increment(),
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // buy and add to cart button
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: amber,
                                side: BorderSide.none,
                              ),
                              onPressed: () {},
                              child: const Text('Buy Now'),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                cart.add(
                                  Products(
                                    title: widget.products.title,
                                    description: widget.products.description,
                                    image: widget.products.image,
                                    category: widget.products.category,
                                    price: widget.products.price,
                                    count: count,
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/icons/cart.png',
                                fit: BoxFit.cover,
                                height: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
