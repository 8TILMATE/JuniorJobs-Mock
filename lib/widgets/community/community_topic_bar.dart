import 'package:flutter/material.dart';

import '../pill.dart';

class CommunityTopicBar extends StatelessWidget {
  const CommunityTopicBar({
    super.key,
    required this.topics,
    required this.selectedTopic,
    required this.onSelected,
  });

  final List<String> topics;
  final String selectedTopic;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final topic in topics) ...[
            Pill(
              label: topic,
              selected: topic == selectedTopic,
              onTap: () => onSelected(topic),
            ),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}
