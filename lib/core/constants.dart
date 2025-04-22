/// Constantes utilizadas em toda a aplicação
class Constants {
  /// Duração padrão para animações
  static const animationDuration = Duration(milliseconds: 500);
  static const quickAnimationDuration = Duration(milliseconds: 300);
  
  /// Valores de padding e margin
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  
  /// Valores de border radius
  static const double defaultRadius = 12.0;
  static const double smallRadius = 8.0;
  static const double largeRadius = 16.0;
  
  /// Tamanhos de fonte
  static const double smallText = 12.0;
  static const double bodyText = 14.0;
  static const double titleText = 16.0;
  static const double headlineText = 20.0;
  
  /// Tamanhos de imagem
  static const double thumbnailSize = 50.0;
  static const double mediumImageSize = 100.0;
  static const double largeImageSize = 200.0;
  
  /// Opacidades
  static const double disabledOpacity = 0.6;
  static const double hoverOpacity = 0.8;
  static const double activeOpacity = 1.0;
  
  /// Chaves para SharedPreferences
  static const String themeModeKey = 'isDarkMode';
  
  /// Mensagens de erro
  static const String networkError = 'Erro de conexão. Tente novamente.';
  static const String generalError = 'Ocorreu um erro. Tente novamente.';
  static const String emptyCartMessage = 'Seu carrinho está vazio.';
  
  /// Textos do aplicativo
  static const String appTitle = 'Lista Expansível';
  static const String addToCart = 'Adicionar ao Carrinho';
  static const String outOfStock = 'Produto Indisponível';
  static const String cart = 'Carrinho';
  static const String total = 'Total';
  
  /// Valores numéricos
  static const int maxCartItems = 99;
  static const int minStockAlert = 5;
  
  /// Não permitir instanciação
  Constants._();
} 