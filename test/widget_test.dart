// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aula_dispositivos/main.dart';
import 'package:aula_dispositivos/models/product.dart';
import 'package:aula_dispositivos/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp(isDarkMode: false));

    // Verify that the app title is displayed
    expect(find.text('Lista Expansível'), findsOneWidget);

    // Verify that we have a shopping cart icon
    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);

    // Verify that we have a theme toggle icon
    expect(find.byIcon(Icons.dark_mode), findsOneWidget);

    // Tap on a product to expand it
    await tester.tap(find.text('Smartphone XYZ'));
    await tester.pumpAndSettle();

    // Verify that the product description is now visible
    expect(
      find.text('Smartphone de última geração com câmera de alta resolução e processador rápido.'),
      findsOneWidget,
    );
  });

  test('CartProvider test', () {
    final cart = CartProvider();
    final product = Product(
      id: '1',
      title: 'Test Product',
      description: 'Test Description',
      price: 100.0,
      imageUrl: 'https://example.com/image.jpg',
      stockQuantity: 10,
    );

    // Test adding item
    cart.addItem(product);
    expect(cart.itemCount, 1);
    expect(cart.total, 100.0);

    // Test removing item
    cart.removeItem(product.id);
    expect(cart.itemCount, 0);
    expect(cart.total, 0.0);
  });
}
