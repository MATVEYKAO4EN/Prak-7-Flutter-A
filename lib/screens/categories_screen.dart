import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import '../data/data_service.dart';
import 'add_category_screen.dart';
import 'products_screen.dart';
import 'auth_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final DataService _dataService = DataService();

  void _refresh() {
    setState(() {});
  }

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AuthScreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Категории продуктов'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'Выйти',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _dataService.categories.length,
        itemBuilder: (context, index) {
          final category = _dataService.categories[index];
          return CategoryCard(
            category: category,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsScreen(categoryId: category.id),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCategoryScreen()),
          ).then((_) => _refresh());
        },
        child: Icon(Icons.add),
        tooltip: 'Добавить категорию',
      ),
    );
  }
}