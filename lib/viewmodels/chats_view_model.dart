import 'package:flutter/foundation.dart';

import '../models/chat_thread.dart';
import '../repositories/mock_content_repository.dart';

class ChatsViewModel extends ChangeNotifier {
  ChatsViewModel(MockContentRepository repository)
    : threads = repository.getChatThreads();

  final List<ChatThread> threads;
}
