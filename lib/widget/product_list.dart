import 'package:flutter/material.dart';

import '../screen/product_details.dart';
import '../model/product_model.dart';

String truncate(String str, [int size = 80]) {
  if (str.length > size) {
    return str.substring(0, size) + '...';
  }
  return str;
}

class ProductList extends StatelessWidget {
  const ProductList(
      {Key? key, required this.productList, required this.toggleWishlist})
      : super(key: key);
  final List<Product> productList;
  final Function toggleWishlist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(
                      product: productList[index],
                      toggleFeatured: () => toggleWishlist(productList[index]),
                    ),
                  ),
                );
              },
              leading: Hero(
                tag: 'product_${productList[index].title}',
                child: Image.network(productList[index].imageUrl),
              ),
              title: Text(
                truncate(productList[index].title),
                style: const TextStyle(fontSize: 16),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      productList[index].price,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
