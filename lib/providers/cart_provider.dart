import 'package:flutter/foundation.dart';
import '../models/product.dart';

/// Gerenciador de estado do carrinho de compras usando ChangeNotifier.
/// 
/// Este provider mantém o estado do carrinho, incluindo os produtos
/// adicionados e suas quantidades.
class CartProvider with ChangeNotifier {
  /// Mapa de produtos no carrinho e suas quantidades
  final Map<String, int> _items = {};
  
  /// Lista de produtos para referência
  final List<Product> _products = [];

  /// Retorna uma cópia somente leitura do mapa de itens
  Map<String, int> get items => Map.unmodifiable(_items);
  
  /// Retorna a lista de produtos
  List<Product> get products => List.unmodifiable(_products);

  /// Retorna a quantidade total de itens no carrinho
  int get itemCount => _items.values.fold(0, (sum, quantity) => sum + quantity);

  /// Retorna o valor total do carrinho
  double get total {
    return _items.entries.fold(0.0, (sum, entry) {
      final product = _findProduct(entry.key);
      if (product != null) {
        return sum + (product.price * entry.value);
      }
      return sum;
    });
  }

  /// Adiciona um produto ao carrinho
  void addItem(Product product) {
    if (!_products.contains(product)) {
      _products.add(product);
    }
    
    if (_items.containsKey(product.id)) {
      _items[product.id] = _items[product.id]! + 1;
    } else {
      _items[product.id] = 1;
    }
    notifyListeners();
  }

  /// Remove um produto do carrinho
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  /// Diminui a quantidade de um produto no carrinho
  void decreaseQuantity(String productId) {
    if (!_items.containsKey(productId)) return;
    
    if (_items[productId] == 1) {
      removeItem(productId);
    } else {
      _items[productId] = _items[productId]! - 1;
      notifyListeners();
    }
  }

  /// Limpa todos os itens do carrinho
  void clear() {
    _items.clear();
    notifyListeners();
  }

  /// Encontra um produto pelo ID
  Product? _findProduct(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Retorna a quantidade de um produto específico no carrinho
  int getQuantity(String productId) {
    return _items[productId] ?? 0;
  }

  /// Verifica se um produto está no carrinho
  bool hasProduct(String productId) {
    return _items.containsKey(productId);
  }
} 