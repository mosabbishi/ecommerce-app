import 'package:ecommerce_app/consts/themes_const.dart';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            itemCount: cart.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.all(6.0),
                  tileColor: Colors.white,
                  leading: Image.asset(cart[index].image),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(cart[index].title),
                      Text('x${cart[index].count}')
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(cart[index].category),
                      Text('${cart[index].price} \$'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(IconlyBold.delete),
                    onPressed: () {
                      setState(() {
                        cart.removeAt(index);
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen(products: cart[index]);
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
          //
          const Spacer(),
          // Text('total : $total'),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: amber,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                onPressed: () {},
                child: const Text('BUY NOW'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
