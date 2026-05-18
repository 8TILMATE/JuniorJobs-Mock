import 'package:flutter/material.dart';

import '../core/brand_assets.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.size = 42, this.showWordmark = false});

  final double size;
  final bool showWordmark;

  @override
  Widget build(BuildContext context) {
    final logoAsset = BrandAssets.logoAsset;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.20)),
          ),
          child: logoAsset == null
              ? Center(
                  child: Text(
                    'Logo',
                    style: TextStyle(
                      color: const Color(0xFF111827),
                      fontSize: size * 0.24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                )
              : Image.asset(logoAsset, fit: BoxFit.contain),
        ),
        if (showWordmark) ...[
          const SizedBox(width: 12),
          const Flexible(
            child: Text(
              'Junior Jobs',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
        ],
      ],
    );
  }
}
