import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final products = cart.products;
    final items = cart.items;

    return Scaffold(
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    Constants.total,
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      'R\$ ${cart.total.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                    onPressed: cart.itemCount == 0
                        ? null
                        : () {
                            cart.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Pedido realizado com sucesso!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                    child: const Text('COMPRAR'),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: cart.itemCount == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 64,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          Constants.emptyCartMessage,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (ctx, i) {
                      final product = products[i];
                      final quantity = cart.getQuantity(product.id);
                      if (quantity == 0) return const SizedBox.shrink();
                      
                      return Dismissible(
                        key: ValueKey(product.id),
                        background: Container(
                          color: Theme.of(context).colorScheme.error,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 4,
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          cart.removeItem(product.id);
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 4,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              title: Text(product.title),
                              subtitle: Text(
                                'Total: R\$ ${(product.price * quantity).toStringAsFixed(2)}',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      cart.decreaseQuantity(product.id);
                                    },
                                  ),
                                  Text('${quantity}x'),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      cart.addItem(product);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
} 