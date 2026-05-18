import 'package:flutter/material.dart';

import '../../core/app_brand.dart';
import '../../models/community_post.dart';
import '../pill.dart';

class CommunityPostCard extends StatelessWidget {
  const CommunityPostCard({super.key, required this.post});

  final CommunityPost post;

  @override
  Widget build(BuildContext context) {
    final accent = Color(post.accentColor);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF101722).withValues(alpha: 0.84),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _AuthorAvatar(author: post.author, color: accent),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.author,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${post.school} - ${post.timeAgo}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Pill(label: post.badge, selected: true),
            ],
          ),
          const SizedBox(height: 14),
          _PreviewTile(post: post, accent: accent),
          const SizedBox(height: 14),
          Text(
            post.title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 7),
          Text(
            post.body,
            style: const TextStyle(color: Colors.white70, height: 1.35),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _PostMetric(
                icon: Icons.mode_comment_outlined,
                label: '${post.replies} raspunsuri',
              ),
              const SizedBox(width: 14),
              _PostMetric(
                icon: Icons.bookmark_border_rounded,
                label: '${post.saves} salvate',
              ),
              const Spacer(),
              IconButton.filledTonal(
                tooltip: 'Raspunde',
                onPressed: () {},
                icon: const Icon(Icons.reply_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AuthorAvatar extends StatelessWidget {
  const _AuthorAvatar({required this.author, required this.color});

  final String author;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 23,
      backgroundColor: color.withValues(alpha: 0.22),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: color,
        child: Text(
          author.substring(0, 1).toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

class _PreviewTile extends StatelessWidget {
  const _PreviewTile({required this.post, required this.accent});

  final CommunityPost post;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.8,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              accent.withValues(alpha: 0.82),
              AppBrand.background.withValues(alpha: 0.88),
            ],
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(_previewIcon(post.badge), size: 28),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                post.previewLabel,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                  height: 1.12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _previewIcon(String badge) {
    switch (badge) {
      case 'VideoCV':
        return Icons.play_circle_outline_rounded;
      case 'Mentor':
        return Icons.rate_review_outlined;
      case 'Interviu':
        return Icons.forum_outlined;
      default:
        return Icons.auto_awesome_outlined;
    }
  }
}

class _PostMetric extends StatelessWidget {
  const _PostMetric({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 17, color: AppBrand.softBlue),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.white60, fontSize: 12),
        ),
      ],
    );
  }
}
