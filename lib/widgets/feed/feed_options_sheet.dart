import 'package:flutter/material.dart';

import '../../viewmodels/feed_view_model.dart';
import '../pill.dart';

class FeedOptionsSheet extends StatelessWidget {
  const FeedOptionsSheet({super.key, required this.viewModel});

  final FeedViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Pill(
                label: 'Plata',
                icon: Icons.euro,
                selected: viewModel.showPay,
                onTap: viewModel.togglePay,
              ),
              Pill(
                label: 'Durata',
                icon: Icons.calendar_month_outlined,
                selected: viewModel.showDuration,
                onTap: viewModel.toggleDuration,
              ),
              Pill(
                label: 'Abilitati',
                icon: Icons.auto_awesome,
                selected: viewModel.showSkills,
                onTap: viewModel.toggleSkills,
              ),
              Pill(
                label: 'Doar la distanta',
                icon: Icons.public,
                selected: viewModel.remoteOnly,
                onTap: viewModel.toggleRemoteOnly,
              ),
            ],
          ),
        );
      },
    );
  }
}
