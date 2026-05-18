import 'package:flutter/material.dart';

import '../core/app_brand.dart';
import '../viewmodels/home_view_model.dart';

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({super.key, required this.home});

  final HomeViewModel home;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 86,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        decoration: BoxDecoration(
          color: AppBrand.background.withValues(alpha: 0.96),
          border: Border(
            top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavItem(
              icon: Icons.groups_2_outlined,
              label: 'Comunitate',
              selected: home.selectedTab == HomeTab.community,
              onTap: () => home.selectTab(HomeTab.community),
            ),
            Transform.translate(
              offset: const Offset(0, -20),
              child: _FeedButton(
                selected: home.selectedTab == HomeTab.feed,
                onTap: () => home.selectTab(HomeTab.feed),
              ),
            ),
            _NavItem(
              icon: Icons.chat_bubble_outline_rounded,
              label: 'Chat',
              selected: home.selectedTab == HomeTab.chats,
              onTap: () => home.selectTab(HomeTab.chats),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: SizedBox(
        width: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: selected ? AppBrand.brightBlue : Colors.white54),
            const SizedBox(height: 5),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: selected ? Colors.white : Colors.white54,
                fontSize: 12,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeedButton extends StatelessWidget {
  const _FeedButton({required this.selected, required this.onTap});

  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [AppBrand.primaryBlue, AppBrand.brightBlue],
          ),
          boxShadow: [
            BoxShadow(
              color: AppBrand.brightBlue.withValues(
                alpha: selected ? 0.45 : 0.22,
              ),
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: const SizedBox(
          width: 72,
          height: 72,
          child: Icon(Icons.smart_display_rounded, size: 34),
        ),
      ),
    );
  }
}
