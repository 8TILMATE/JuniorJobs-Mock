import 'package:flutter/material.dart';

import '../core/app_brand.dart';
import 'brand_logo.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key, required this.title, this.trailing = const []});

  final String title;
  final List<Widget> trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppBrand.surfaceMuted.withValues(alpha: 0.94),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppBrand.brightBlue.withValues(alpha: 0.18)),
      ),
      child: Row(
        children: [
          const BrandLogo(size: 38),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
            ),
          ),
          ...trailing,
        ],
      ),
    );
  }
}
