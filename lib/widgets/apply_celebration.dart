import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../core/app_brand.dart';

void showApplyCelebration(BuildContext context) {
  final overlay = Overlay.of(context);
  late final OverlayEntry entry;
  entry = OverlayEntry(
    builder: (_) => _ApplyCelebration(onFinished: () => entry.remove()),
  );
  overlay.insert(entry);
}

class _ApplyCelebration extends StatefulWidget {
  const _ApplyCelebration({required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<_ApplyCelebration> createState() => _ApplyCelebrationState();
}

class _ApplyCelebrationState extends State<_ApplyCelebration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 1550),
          )
          ..forward()
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              widget.onFinished();
            }
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Material(
        color: Colors.transparent,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final t = Curves.easeOutCubic.transform(_controller.value);
            final fade = _controller.value < 0.72
                ? 1.0
                : 1 - ((_controller.value - 0.72) / 0.28).clamp(0.0, 1.0);
            return Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _ApplyParticlePainter(progress: t, opacity: fade),
                  ),
                ),
                Positioned(
                  left: 28,
                  right: 28,
                  bottom: 112 + (42 * t),
                  child: Opacity(
                    opacity: fade,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 13,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF252A35,
                          ).withValues(alpha: 0.96),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: AppBrand.brightBlue.withValues(alpha: 0.44),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppBrand.brightBlue.withValues(
                                alpha: 0.18,
                              ),
                              blurRadius: 24,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Ai aplicat cu succes!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ApplyParticlePainter extends CustomPainter {
  const _ApplyParticlePainter({required this.progress, required this.opacity});

  final double progress;
  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    final origin = Offset(size.width / 2, size.height - 72);
    final paint = Paint()..style = PaintingStyle.fill;
    const colors = [
      AppBrand.brightBlue,
      AppBrand.softBlue,
      AppBrand.primaryBlue,
      Color(0xFFFFFFFF),
    ];

    for (var i = 0; i < 28; i++) {
      final angle = -math.pi / 2 + (i - 13.5) * 0.075;
      final distance = 34 + (i % 7) * 17 + progress * (98 + (i % 5) * 18);
      final sway = math.sin(progress * math.pi + i) * 18;
      final position =
          origin +
          Offset(math.cos(angle) * distance + sway, math.sin(angle) * distance);
      final radius = (2.8 + (i % 4) * 1.1) * (1 - progress * 0.45);
      paint.color = colors[i % colors.length].withValues(alpha: opacity);
      canvas.drawCircle(position, radius, paint);
    }

    final beamPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [Color(0x552595FF), Color(0x000D56B3)],
      ).createShader(Rect.fromLTWH(origin.dx - 58, origin.dy - 170, 116, 170));
    final beamPath = Path()
      ..moveTo(origin.dx - 34, origin.dy)
      ..quadraticBezierTo(
        origin.dx,
        origin.dy - 120 * progress,
        origin.dx + 34,
        origin.dy,
      )
      ..close();
    canvas.drawPath(beamPath, beamPaint);
  }

  @override
  bool shouldRepaint(_ApplyParticlePainter oldDelegate) {
    return progress != oldDelegate.progress || opacity != oldDelegate.opacity;
  }
}
