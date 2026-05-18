import 'package:flutter/material.dart';

import '../../core/app_brand.dart';
import '../app_chrome.dart';

class CommunityHeader extends StatelessWidget {
  const CommunityHeader({super.key, required this.onOpenProfile});

  final VoidCallback onOpenProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTopBar(
          title: 'Comunitate',
          trailing: [
            IconButton.filledTonal(
              tooltip: 'Editeaza profilul',
              onPressed: onOpenProfile,
              icon: const Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppBrand.surface.withValues(alpha: 0.78),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: AppBrand.brightBlue.withValues(alpha: 0.18),
            ),
          ),
          child: Row(
            children: [
              const _AvatarStack(),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Intrebarea zilei',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Cum iti prezinti primul proiect intr-un interviu?',
                      style: TextStyle(color: Colors.white70, height: 1.25),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_rounded, color: AppBrand.softBlue),
            ],
          ),
        ),
      ],
    );
  }
}

class _AvatarStack extends StatelessWidget {
  const _AvatarStack();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 76,
      height: 48,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: _MiniAvatar(label: 'B', color: AppBrand.primaryBlue),
          ),
          Positioned(
            left: 24,
            child: _MiniAvatar(label: 'A', color: AppBrand.brightBlue),
          ),
          Positioned(
            left: 48,
            child: _MiniAvatar(label: '+', color: AppBrand.surfaceMuted),
          ),
        ],
      ),
    );
  }
}

class _MiniAvatar extends StatelessWidget {
  const _MiniAvatar({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: const Color(0xFF07111F),
      child: CircleAvatar(
        radius: 21,
        backgroundColor: color,
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w900)),
      ),
    );
  }
}
