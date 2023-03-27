class Products {
  String title;
  String image;
  String description;
  double price;
  String category;
  bool isTopProducts;
  int count;

  Products({
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
    this.isTopProducts = true,
    this.count = 0,
  });
}

final List<Products> productsList = [
  Products(
    title: 'polo shirt1',
    category: 'Clothes',
    description: 'light color polo summer shirt',
    image: 'assets/images/shirt.jpg',
    price: 100.0,
    isTopProducts: true,
  ),
  Products(
    title: 'polo shirt2',
    category: 'Clothes',
    description: 'light color polo summer shirt',
    image: 'assets/images/shirt.jpg',
    price: 120.0,
    isTopProducts: false,
  ),
  Products(
    title: 'sony headset',
    category: 'Electronics',
    description: 'light weight gaming headset from sony',
    image: 'assets/images/elec.jpg',
    price: 110.0,
    isTopProducts: true,
  ),
  Products(
    title: 'Running shoes',
    category: 'shoes',
    description: 'light weight gaming headset from sony',
    image: 'assets/images/shoes1.jpg',
    price: 110.0,
    isTopProducts: true,
  ),
];

List<Products> cart = [];
