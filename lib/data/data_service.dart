import '../models/product.dart';
import '../models/category.dart';

class DataService {
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  List<Category> categories = [
    Category(id: '1', name: 'Электроника', description: 'Гаджеты и устройства'),
    Category(id: '2', name: 'Одежда', description: 'Модная одежда'),
  ];

  List<Product> products = [
    Product(
      id: '1',
      name: 'Смартфон',
      description: 'Мощный смартфон',
      price: 29999,
      categoryId: '1',
    ),
    Product(
      id: '2',
      name: 'Футболка',
      description: 'Хлопковая футболка',
      price: 999,
      categoryId: '2',
    ),
  ];

  void addCategory(Category category) {
    categories.add(category);
  }

  void addProduct(Product product) {
    products.add(product);
  }

  String? getCategoryName(String categoryId) {
    try {
      return categories.firstWhere((cat) => cat.id == categoryId).name;
    } catch (e) {
      return null;
    }
  }
}