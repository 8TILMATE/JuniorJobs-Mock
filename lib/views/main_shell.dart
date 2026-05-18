import 'package:flutter/material.dart';

import '../core/app_scope.dart';
import '../widgets/main_bottom_nav.dart';
import '../widgets/profile_drawer.dart';
import 'chats_view.dart';
import 'community_view.dart';
import 'feed_view.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    final home = AppScope.of(context).home;
    return AnimatedBuilder(
      animation: home,
      builder: (context, _) {
        return Scaffold(
          endDrawer: const ProfileDrawer(),
          body: IndexedStack(
            index: home.selectedTab.index,
            children: const [CommunityView(), FeedView(), ChatsView()],
          ),
          bottomNavigationBar: MainBottomNav(home: home),
        );
      },
    );
  }
}
