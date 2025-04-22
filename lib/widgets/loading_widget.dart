import 'package:flutter/material.dart';

/// Widget de loading reutilizável com animação suave
class LoadingWidget extends StatelessWidget {
  final double size;
  final Color? color;

  const LoadingWidget({
    Key? key,
    this.size = 24.0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: color ?? theme.colorScheme.primary,
        ),
      ),
    );
  }
} 