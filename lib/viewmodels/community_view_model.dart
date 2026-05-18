import 'package:flutter/foundation.dart';

import '../models/community_post.dart';
import '../repositories/mock_content_repository.dart';

class CommunityViewModel extends ChangeNotifier {
  CommunityViewModel(MockContentRepository repository)
    : posts = repository.getCommunityPosts();

  final List<CommunityPost> posts;

  String _selectedTopic = 'Toate';

  String get selectedTopic => _selectedTopic;

  List<String> get topics => const ['Toate', 'VideoCV', 'Mentor', 'Interviu'];

  List<CommunityPost> get visiblePosts {
    if (_selectedTopic == 'Toate') {
      return posts;
    }
    return posts.where((post) => post.badge == _selectedTopic).toList();
  }

  void selectTopic(String topic) {
    _selectedTopic = topic;
    notifyListeners();
  }
}
