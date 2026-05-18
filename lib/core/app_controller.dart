import '../repositories/auth_repository.dart';
import '../repositories/mock_content_repository.dart';
import '../viewmodels/auth_view_model.dart';
import '../viewmodels/chats_view_model.dart';
import '../viewmodels/community_view_model.dart';
import '../viewmodels/feed_view_model.dart';
import '../viewmodels/home_view_model.dart';
import '../viewmodels/profile_view_model.dart';

class AppController {
  AppController()
    : _contentRepository = MockContentRepository(),
      auth = AuthViewModel(AuthRepository()) {
    home = HomeViewModel();
    feed = FeedViewModel(_contentRepository);
    community = CommunityViewModel(_contentRepository);
    chats = ChatsViewModel(_contentRepository);
    profile = ProfileViewModel(_contentRepository);
  }

  final MockContentRepository _contentRepository;
  final AuthViewModel auth;
  late final HomeViewModel home;
  late final FeedViewModel feed;
  late final CommunityViewModel community;
  late final ChatsViewModel chats;
  late final ProfileViewModel profile;

  void dispose() {
    auth.dispose();
    home.dispose();
    feed.dispose();
    community.dispose();
    chats.dispose();
    profile.dispose();
  }
}
