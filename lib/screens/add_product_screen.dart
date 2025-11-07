import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/data_service.dart';

class AddProductScreen extends StatefulWidget {
  final String categoryId;

  AddProductScreen({required this.categoryId});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final DataService _dataService = DataService();

  void _addProduct() {
    if (_nameController.text.isEmpty || _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Заполните обязательные поля')),
      );
      return;
    }

    final price = double.tryParse(_priceController.text);
    if (price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Введите корректную цену')),
      );
      return;
    }

    final newProduct = Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text,
      description: _descriptionController.text,
      price: price,
      categoryId: widget.categoryId,
    );

    _dataService.addProduct(newProduct);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Добавить продукт')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Название продукта',
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
            SizedBox(height: 16),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Цена',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _addProduct,
              child: Text('Добавить продукт'),
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