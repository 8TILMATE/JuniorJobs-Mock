import 'package:flutter/material.dart';

import '../../core/app_brand.dart';

class JobActionButton extends StatelessWidget {
  const JobActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.filled = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: filled
                  ? AppBrand.brightBlue
                  : Colors.black.withValues(alpha: 0.44),
              border: Border.all(color: Colors.white.withValues(alpha: 0.24)),
              boxShadow: filled
                  ? [
                      BoxShadow(
                        color: AppBrand.brightBlue.withValues(alpha: 0.28),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              color: filled ? const Color(0xFF07101D) : Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              shadows: [Shadow(color: Colors.black, blurRadius: 8)],
            ),
          ),
        ],
      ),
    );
  }
}
