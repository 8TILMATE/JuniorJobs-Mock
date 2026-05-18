import 'package:flutter/material.dart';

import '../../core/app_brand.dart';

class CommunityComposer extends StatelessWidget {
  const CommunityComposer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppBrand.primaryBlue,
            child: Text('B', style: TextStyle(fontWeight: FontWeight.w900)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: AppBrand.surfaceMuted.withValues(alpha: 0.62),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Intreaba comunitatea...',
                style: TextStyle(color: Colors.white60),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton.filled(
            tooltip: 'Posteaza',
            onPressed: () {},
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
    );
  }
}
