import 'package:flutter/foundation.dart';

import '../models/job_post.dart';
import '../repositories/mock_content_repository.dart';

class FeedViewModel extends ChangeNotifier {
  FeedViewModel(MockContentRepository repository) : jobs = repository.getJobs();

  final List<JobPost> jobs;

  int _currentIndex = 0;
  bool _showPay = true;
  bool _showDuration = true;
  bool _showSkills = true;
  bool _remoteOnly = false;
  final Set<String> _appliedCompanies = <String>{};

  int get currentIndex => _currentIndex;
  bool get showPay => _showPay;
  bool get showDuration => _showDuration;
  bool get showSkills => _showSkills;
  bool get remoteOnly => _remoteOnly;

  List<JobPost> get visibleJobs {
    if (!_remoteOnly) {
      return jobs;
    }
    return jobs.where((job) => job.workMode == WorkMode.remote).toList();
  }

  bool isApplied(JobPost job) => _appliedCompanies.contains(job.company);

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void togglePay() {
    _showPay = !_showPay;
    notifyListeners();
  }

  void toggleDuration() {
    _showDuration = !_showDuration;
    notifyListeners();
  }

  void toggleSkills() {
    _showSkills = !_showSkills;
    notifyListeners();
  }

  void toggleRemoteOnly() {
    _remoteOnly = !_remoteOnly;
    _currentIndex = 0;
    notifyListeners();
  }

  void applyTo(JobPost job) {
    _appliedCompanies.add(job.company);
    notifyListeners();
  }
}
