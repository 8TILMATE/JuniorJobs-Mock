class CommunityPost {
  const CommunityPost({
    required this.author,
    required this.school,
    required this.timeAgo,
    required this.title,
    required this.body,
    required this.badge,
    required this.previewLabel,
    required this.accentColor,
    required this.replies,
    required this.saves,
  });

  final String author;
  final String school;
  final String timeAgo;
  final String title;
  final String body;
  final String badge;
  final String previewLabel;
  final int accentColor;
  final int replies;
  final int saves;
}
