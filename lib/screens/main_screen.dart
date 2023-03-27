import 'package:ecommerce_app/consts/images_consts.dart';
import 'package:ecommerce_app/consts/text_const.dart';
import 'package:ecommerce_app/consts/themes_const.dart';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/screens/details_screen.dart';
import 'package:ecommerce_app/screens/inner_categories_screen.dart';
import 'package:ecommerce_app/widgets/category_box.dart';
import 'package:ecommerce_app/widgets/products_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'categories_screen.dart';
import 'top_products_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  // Products? products;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Icon(
          Icons.menu,
          color: amber,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              IconlyLight.notification,
              color: amber,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // some text (explore or somthing)
              Text(
                'EXPLORE',
                style: headlineStyle,
              ),
              Text(
                'Best products in one place!',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              // search bar and filter icon
              const SizedBox(height: 15.0),
              const CupertinoSearchTextField(),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: headlineStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const CategoriesScreen();
                        },
                      ));
                    },
                    child: const Text('See All'),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),

              // categories listView
              SizedBox(
                height: size.height * 0.14,
                child: ListView.builder(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryBox(
                      image: images[index][0],
                      title: images[index][1],
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return InnerCategoriesScreen(
                                title: cat[index]['title'],
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              // products feed
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Products',
                    style: headlineStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const TopProductsScreen();
                          },
                        ),
                      );
                    },
                    child: const Text('see all'),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.26,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: productsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 5.0),
                      child: productsList[index].isTopProducts
                          ? ProductsBox(
                              image: productsList[index].image,
                              title: productsList[index].title,
                              price: productsList[index].price,
                              isTop: productsList[index].isTopProducts = true,
                              function: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return DetailsScreen(
                                      products: productsList[index],
                                    );
                                  },
                                ));
                              },
                            )
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
