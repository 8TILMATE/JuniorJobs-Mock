import 'package:flutter/foundation.dart';

import '../models/student_profile.dart';
import '../repositories/mock_content_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel(MockContentRepository repository)
    : _profile = repository.getProfile();

  StudentProfile _profile;

  StudentProfile get profile => _profile;

  void updateHeadline(String headline) {
    _profile = _profile.copyWith(headline: headline);
    notifyListeners();
  }

  void updateCity(String city) {
    _profile = _profile.copyWith(city: city);
    notifyListeners();
  }
}
