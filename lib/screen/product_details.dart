import 'package:flutter/material.dart';
import '../model/product_model.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail(
      {Key? key, required this.product, required this.toggleFeatured})
      : super(key: key);
  final Product product;
  final Function toggleFeatured;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width - 15,
              child: Hero(
                tag: 'product_${widget.product.title}',
                child:
                    Image.network(widget.product.imageUrl, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Text(widget.product.title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 10),
              child: Text(
                widget.product.description,
                style: const TextStyle(fontSize: 17),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
