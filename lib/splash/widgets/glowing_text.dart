import 'package:flutter/material.dart';

class GlowingText extends StatefulWidget {
  const GlowingText({
    required this.text,
    required this.style,
    super.key,
  });

  final String text;
  final TextStyle style;

  @override
  State<GlowingText> createState() => _GlowingTextState();
}

class _GlowingTextState extends State<GlowingText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 12).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
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
        return Text(
          widget.text,
          style: widget.style.copyWith(
            shadows: [
              Shadow(
                color: (widget.style.color ?? const Color(0xFFFFF1D1))
                    .withValues(alpha: 0.8),
                blurRadius: _animation.value,
              ),
            ],
          ),
        );
      },
    );
  }
}
