import 'package:flutter/material.dart';

/// Widget que aplica uma animação de pulso suave em seu filho.
/// 
/// Útil para destacar elementos interativos ou chamar atenção para
/// determinados widgets na interface.
class PulseAnimation extends StatefulWidget {
  /// Widget filho que receberá a animação
  final Widget child;
  
  /// Duração de um ciclo completo da animação
  final Duration duration;
  
  /// Escala máxima que o widget atingirá
  final double maxScale;

  const PulseAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.maxScale = 1.05,
  }) : super(key: key);

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    // Inicializa o controller com a duração especificada
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Cria uma animação que vai de 1.0 até maxScale e volta
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: widget.maxScale)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: widget.maxScale, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50.0,
      ),
    ]).animate(_controller);

    // Inicia a animação em loop
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
} 