import 'package:flutter/material.dart';

class AssetOrIcon extends StatelessWidget {
  const AssetOrIcon({
    super.key,
    required this.assetPath,
    required this.fallbackIcon,
    this.size = 22,
  });

  final String? assetPath;
  final IconData fallbackIcon;
  final double size;

  @override
  Widget build(BuildContext context) {
    final path = assetPath;
    if (path == null || path.isEmpty) {
      return Icon(fallbackIcon, size: size);
    }
    return Image.asset(
      path,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Icon(fallbackIcon, size: size);
      },
    );
  }
}
