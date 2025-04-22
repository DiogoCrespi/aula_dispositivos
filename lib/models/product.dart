/// Representa um produto no aplicativo com suas propriedades e métodos.
/// 
/// Este modelo é usado para exibir produtos na lista expansível e
/// gerenciar o carrinho de compras.
class Product {
  /// Identificador único do produto
  final String id;
  
  /// Nome do produto
  final String title;
  
  /// Descrição detalhada do produto
  final String description;
  
  /// Preço do produto em reais
  final double price;
  
  /// URL da imagem do produto
  final String imageUrl;
  
  /// Quantidade disponível em estoque
  final int stockQuantity;

  /// Construtor const para melhor performance
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.stockQuantity = 0,
  });

  /// Cria uma cópia do produto com alguns campos atualizados
  Product copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? imageUrl,
    int? stockQuantity,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      stockQuantity: stockQuantity ?? this.stockQuantity,
    );
  }

  /// Converte o produto para um Map (útil para serialização)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'stockQuantity': stockQuantity,
    };
  }

  /// Cria um produto a partir de um Map (útil para deserialização)
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      price: (map['price'] as num).toDouble(),
      imageUrl: map['imageUrl'] as String,
      stockQuantity: map['stockQuantity'] as int? ?? 0,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, stockQuantity: $stockQuantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
} 