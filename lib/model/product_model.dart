import './category_model.dart';

class Product {
  final Category category;
  final String title;
  final String price;
  final String imageUrl;
  final String description;

  const Product({
    required this.category,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  // to json
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}
