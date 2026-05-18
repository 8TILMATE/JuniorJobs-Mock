import 'package:flutter/material.dart';

import '../core/app_scope.dart';
import '../widgets/app_chrome.dart';
import '../widgets/community/community_composer.dart';
import '../widgets/community/community_header.dart';
import '../widgets/community/community_post_card.dart';
import '../widgets/community/community_topic_bar.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = AppScope.of(context).community;
    return Scaffold(
      body: GradientBackground(
        colors: const [Color(0xFF07111F), Color(0xFF101722), Color(0xFF092A52)],
        child: SafeArea(
          child: AnimatedBuilder(
            animation: viewModel,
            builder: (context, _) {
              return ListView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
                children: [
                  CommunityHeader(
                    onOpenProfile: () => Scaffold.of(context).openEndDrawer(),
                  ),
                  const SizedBox(height: 14),
                  const CommunityComposer(),
                  const SizedBox(height: 16),
                  CommunityTopicBar(
                    topics: viewModel.topics,
                    selectedTopic: viewModel.selectedTopic,
                    onSelected: viewModel.selectTopic,
                  ),
                  const SizedBox(height: 16),
                  for (final post in viewModel.visiblePosts) ...[
                    CommunityPostCard(post: post),
                    const SizedBox(height: 14),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
