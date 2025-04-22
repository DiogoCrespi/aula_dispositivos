import 'package:flutter/material.dart';

mixin AnimationMixin<T extends StatefulWidget> on State<T> {
  late AnimationController _controller;
  late Animation<double> _animation;

  AnimationController get controller => _controller;
  Animation<double> get animation => _animation;

  void initAnimation({
    required TickerProvider vsync,
    Duration duration = const Duration(milliseconds: 500),
    double begin = 1.0,
    double end = 1.1,
    Curve curve = Curves.easeInOut,
  }) {
    _controller = AnimationController(
      duration: duration,
      vsync: vsync,
    );

    _animation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: curve,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
} 