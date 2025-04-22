import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants.dart';
import '../widgets/expandable_item.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;

  const HomeScreen({
    Key? key,
    required this.onThemeToggle,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Product> products = [
    Product(
      id: '1',
      title: 'Smartphone XYZ',
      description: 'Smartphone de última geração com câmera de alta resolução e processador rápido.',
      price: 2999.99,
      imageUrl: 'https://picsum.photos/200',
      stockQuantity: 10,
    ),
    Product(
      id: '2',
      title: 'Notebook ABC',
      description: 'Notebook potente com tela de alta resolução e bateria de longa duração.',
      price: 4999.99,
      imageUrl: 'https://picsum.photos/201',
      stockQuantity: 5,
    ),
    Product(
      id: '3',
      title: 'Fone de Ouvido Premium',
      description: 'Fone de ouvido com cancelamento de ruído e som de alta qualidade.',
      price: 799.99,
      imageUrl: 'https://picsum.photos/202',
      stockQuantity: 15,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  IconData _getThemeIcon(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Icons.light_mode
        : Icons.dark_mode;
  }

  String _getThemeTooltip(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'Mudar para tema claro'
        : 'Mudar para tema escuro';
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appTitle),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            tooltip: 'Pesquisar',
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  if (_selectedIndex != 1) {
                    _onItemTapped(1);
                  }
                },
                tooltip: Constants.cart,
              ),
              if (cart.itemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${cart.itemCount}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: Icon(_getThemeIcon(context)),
            onPressed: widget.onThemeToggle,
            tooltip: _getThemeTooltip(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Usuário Demo'),
              accountEmail: const Text('usuario@demo.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'UD',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Carrinho'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ExpandableItem(
                product: product,
                onAddToCart: () {
                  cart.addItem(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.title} adicionado ao carrinho!'),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'DESFAZER',
                        onPressed: () {
                          cart.removeItem(product.id);
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const CartScreen(),
          const Center(child: Text('Configurações')),
        ],
      ),
    );
  }
} 