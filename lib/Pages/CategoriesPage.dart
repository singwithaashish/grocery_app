import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/Pages/FavoritesPage.dart';
import 'package:grocery_app/Utility/dummydata.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.categoryIndex});
  final int categoryIndex;
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    var categoryProducts = [
      for (var i = 0; i < allProducts.length; i++)
        if (allProducts[i]['category'] ==
            categories[widget.categoryIndex]['name'])
          i
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(categories[widget.categoryIndex]['name'] as String),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < categoryProducts.length; i++)
              ProdListFullWidth(index: categoryProducts[i])
          ],
        ),
      ),
    );
  }
}
