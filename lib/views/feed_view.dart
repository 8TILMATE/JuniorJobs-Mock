import 'package:flutter/material.dart';

import '../core/app_scope.dart';
import '../widgets/app_chrome.dart';
import '../widgets/feed/feed_options_sheet.dart';
import '../widgets/feed/job_video_card.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    final feed = AppScope.of(context).feed;
    return AnimatedBuilder(
      animation: feed,
      builder: (context, _) {
        final jobs = feed.visibleJobs;
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: jobs.length,
                onPageChanged: feed.setCurrentIndex,
                itemBuilder: (context, index) => JobVideoCard(job: jobs[index]),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
                  child: AppTopBar(
                    title: 'Joburi',
                    trailing: [
                      IconButton.filledTonal(
                        tooltip: 'Optiuni feed',
                        onPressed: () => _showFeedOptions(context),
                        icon: const Icon(Icons.tune_rounded),
                      ),
                      const SizedBox(width: 6),
                      IconButton.filledTonal(
                        tooltip: 'Editeaza profilul',
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                        icon: const Icon(Icons.account_circle_outlined),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFeedOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xFF0B0E25),
      showDragHandle: true,
      builder: (context) {
        return FeedOptionsSheet(viewModel: AppScope.of(context).feed);
      },
    );
  }
}
