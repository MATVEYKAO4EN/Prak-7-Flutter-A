import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/data_service.dart';

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final DataService _dataService = DataService();

  void _addCategory() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Введите название категории')),
      );
      return;
    }

    final newCategory = Category(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text,
      description: _descriptionController.text,
    );

    _dataService.addCategory(newCategory);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Добавить категорию')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Название категории',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Описание',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _addCategory,
              child: Text('Добавить категорию'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}