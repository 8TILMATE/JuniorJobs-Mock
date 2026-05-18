import 'package:flutter/material.dart';

import '../core/app_brand.dart';

class Pill extends StatelessWidget {
  const Pill({
    super.key,
    required this.label,
    this.icon,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final IconData? icon;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[Icon(icon, size: 15), const SizedBox(width: 6)],
        Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
      ],
    );
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? AppBrand.brightBlue.withValues(alpha: 0.18)
              : Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected
                ? AppBrand.brightBlue
                : Colors.white.withValues(alpha: 0.12),
          ),
        ),
        child: DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          child: IconTheme.merge(
            data: IconThemeData(
              color: selected ? AppBrand.brightBlue : Colors.white70,
            ),
            child: content,
          ),
        ),
      ),
    );
  }
}
