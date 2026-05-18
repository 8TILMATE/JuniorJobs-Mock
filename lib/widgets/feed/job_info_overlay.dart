import 'package:flutter/material.dart';

import '../../models/job_post.dart';
import '../../viewmodels/feed_view_model.dart';
import '../pill.dart';

class JobInfoOverlay extends StatelessWidget {
  const JobInfoOverlay({super.key, required this.job, required this.viewModel});

  final JobPost job;
  final FeedViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 96,
      bottom: 22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            job.role,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 5),
          Text(
            '${job.company} - ${job.location}',
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (viewModel.showPay)
                Pill(label: job.pay, icon: Icons.payments_outlined),
              if (viewModel.showDuration)
                Pill(label: job.duration, icon: Icons.schedule),
              Pill(
                label: job.workModeLabel,
                icon: Icons.location_city_outlined,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            job.summary,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(height: 1.32, color: Colors.white),
          ),
          if (viewModel.showSkills) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final skill in job.skills) Pill(label: skill)],
            ),
          ],
        ],
      ),
    );
  }
}
