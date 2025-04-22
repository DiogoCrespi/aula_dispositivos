import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../animations/pulse_animation.dart';
import '../models/product.dart';
import 'loading_widget.dart';

/// Widget que representa um item expansível na lista de produtos.
/// Implementa animações suaves para expansão/contração e efeitos visuais.
class ExpandableItem extends StatefulWidget {
  /// Produto a ser exibido
  final Product product;

  /// Callback chamado quando o botão de adicionar ao carrinho é pressionado
  final VoidCallback onAddToCart;

  const ExpandableItem({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  State<ExpandableItem> createState() => _ExpandableItemState();
}

class _ExpandableItemState extends State<ExpandableItem> {
  /// Controla o estado de expansão do item
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      /// Container animado que controla a expansão/contração do item
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _expanded
              ? (isDark ? colorScheme.surfaceVariant : colorScheme.primaryContainer.withOpacity(0.2))
              : (isDark ? colorScheme.surface : Colors.white),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark 
                  ? Colors.black.withOpacity(0.3)
                  : Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: PulseAnimation(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isDark ? colorScheme.outline : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: widget.product.imageUrl.startsWith('http')
                          ? CachedNetworkImage(
                              imageUrl: widget.product.imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const LoadingWidget(size: 32.0),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            )
                          : Image.asset(
                              widget.product.imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                title: Text(
                  widget.product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isDark ? colorScheme.onSurface : Colors.black87,
                  ),
                ),
                subtitle: Text(
                  'R\$ ${widget.product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: isDark ? colorScheme.primary : Colors.green.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.expand_more,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              /// Conteúdo expandido com animação de altura
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: isDark ? colorScheme.onSurface.withOpacity(0.9) : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (widget.product.stockQuantity > 0) ...[
                        PulseAnimation(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: widget.onAddToCart,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Adicionar ao Carrinho'),
                            ),
                          ),
                        ),
                      ] else ...[
                        Center(
                          child: Text(
                            'Produto Indisponível',
                            style: TextStyle(
                              color: colorScheme.error,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 