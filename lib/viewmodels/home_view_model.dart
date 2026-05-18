import 'package:flutter/foundation.dart';

enum HomeTab { community, feed, chats }

class HomeViewModel extends ChangeNotifier {
  HomeTab _selectedTab = HomeTab.feed;

  HomeTab get selectedTab => _selectedTab;

  void selectTab(HomeTab tab) {
    if (_selectedTab == tab) {
      return;
    }
    _selectedTab = tab;
    notifyListeners();
  }
}
