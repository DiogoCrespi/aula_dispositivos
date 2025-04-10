import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Rodape extends StatelessWidget {
  const Rodape({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.food,
                color: theme.colorScheme.onPrimary,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Receitas Deliciosas',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '© 2024 Todos os direitos reservados',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onPrimary.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  MdiIcons.facebook,
                  color: theme.colorScheme.onPrimary,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.instagram,
                  color: theme.colorScheme.onPrimary,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.youtube,
                  color: theme.colorScheme.onPrimary,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
} 