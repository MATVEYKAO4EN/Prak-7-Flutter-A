import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../data/data_service.dart';
import 'add_product_screen.dart';

class ProductsScreen extends StatefulWidget {
  final String categoryId;

  ProductsScreen({required this.categoryId});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final DataService _dataService = DataService();

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final categoryProducts = _dataService.products
        .where((product) => product.categoryId == widget.categoryId)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Продукты'),
      ),
      body: categoryProducts.isEmpty
          ? Center(child: Text('Нет продуктов в этой категории'))
          : ListView.builder(
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) {
          final product = categoryProducts[index];
          return ProductCard(
            product: product,
            categoryName: _dataService.getCategoryName(product.categoryId),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductScreen(categoryId: widget.categoryId),
            ),
          ).then((_) => _refresh());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}