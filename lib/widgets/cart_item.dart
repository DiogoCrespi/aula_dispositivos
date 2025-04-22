import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'loading_widget.dart';

class CartItem extends StatelessWidget {
  final String imageUrl;

  const CartItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const LoadingWidget(size: 32.0),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }
} 