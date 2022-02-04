import 'package:cloud_firestore/cloud_firestore.dart';

import '../widget/drawer.dart';

import '../model/category_model.dart';
import 'package:flutter/material.dart';
import '../model/product_model.dart';
import '../widget/category_list.dart';
import '../widget/product_list.dart';
import '../widget/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    CollectionReference<Map<String, dynamic>> categoriesMap =
        FirebaseFirestore.instance.collection('store_products');

    categoriesMap.get().then(
      (snapshot) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> categoriesSnap =
            snapshot.docs;
        for (QueryDocumentSnapshot<Map<String, dynamic>> categorySnap
            in categoriesSnap) {
          Map<String, dynamic> data = categorySnap.data();
          Category category = Category(name: data['category'] as String);
          categories.add(category);
          for (int i = 0; i < data['products'].length; i++) {
            var productMap = data['products'][i];
            try {
              productList.add(
                Product(
                  category: category,
                  title: productMap['name'] as String,
                  price: productMap['price'] as String,
                  imageUrl: productMap['imageUrl'] as String,
                  description: productMap['description'] as String,
                ),
              );
            } catch (err) {
              print(err);
            }
          }
        }
        setState(() {});
      },
    );
  }

  List<Category> categories = [];
  Category? currentCategory;
  String searchText = "";
  List<Product> productList = [];

  @override
  Widget build(BuildContext context) {
    List<Product> showProductList = [];
    if (currentCategory != null) {
      showProductList = [];
      for (int i = 0; i < productList.length; i++) {
        if (productList[i].category == currentCategory) {
          showProductList.add(productList[i]);
        }
      }
    } else {
      showProductList = productList;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const AppDrawer(),
        body: Column(
          children: [
            SearchWidget(updateSearchText: updateSearchText),
            CategoryList(
              categories: categories,
              changeCategory: changeCategory,
              currentCategory: currentCategory,
            ),
            ProductList(
                productList: showProductList, toggleWishlist: toggleWishlist),
          ],
        ));
  }

  void updateSearchText(String text) {
    setState(() {
      searchText = text;
      currentCategory = null;
    });
  }

  void changeCategory(Category category) {
    setState(() {
      currentCategory = category;
      searchText = "";
    });
  }

  void toggleWishlist(int productId) {
    setState(() {});
  }
}
