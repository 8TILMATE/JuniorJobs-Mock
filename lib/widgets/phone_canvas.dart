import 'package:flutter/material.dart';

import '../core/app_brand.dart';

class PhoneCanvas extends StatelessWidget {
  const PhoneCanvas({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppBrand.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430, maxHeight: 920),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppBrand.background,
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
