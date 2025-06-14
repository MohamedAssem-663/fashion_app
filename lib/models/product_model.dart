class ProductModel {
  final String image;
  final String name;
  final String description;
  final double price;

  ProductModel({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });
  static List<ProductModel> products = [
    ProductModel(
      image: "assets/product/product1.png",
      name: "Product 1",
      description: "Description of Product 1",
      price: 29.99,
    ),
    ProductModel(
      image: "assets/product/product2.png",
      name: "Product 2",
      description: "Description of Product 2",
      price: 49.99,
    ),
    ProductModel(
      image: "assets/product/product3.png",
      name: "Product 3",
      description: "Description of Product 3",
      price: 59.99,
    ),
    ProductModel(
      image: "assets/product/product4.png",
      name: "Product 4",
      description: "Description of Product 3",
      price: 29.99,
    ),
    ProductModel(
      image: "assets/product/product5.png",
      name: "Product 5",
      description: "Description of Product 3",
      price: 39.99,
    ),
    ProductModel(
      image: "assets/product/product6.png",
      name: "Product 6",
      description: "Description of Product 3",
      price: 39.99,
    ),
  ];
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
}
