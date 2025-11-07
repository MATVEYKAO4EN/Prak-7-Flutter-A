import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(Icons.category, color: Colors.blue),
        title: Text(
          category.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(category.description),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}