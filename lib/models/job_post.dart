enum WorkMode { onSite, hybrid, remote }

class JobPost {
  const JobPost({
    required this.company,
    required this.role,
    required this.location,
    required this.pay,
    required this.duration,
    required this.workMode,
    required this.summary,
    required this.skills,
    required this.gradientColors,
    required this.videoUrl,
    required this.videoPrompt,
    required this.isInternship,
  });

  final String company;
  final String role;
  final String location;
  final String pay;
  final String duration;
  final WorkMode workMode;
  final String summary;
  final List<String> skills;
  final List<int> gradientColors;
  final String videoUrl;
  final String videoPrompt;
  final bool isInternship;

  String get workModeLabel {
    switch (workMode) {
      case WorkMode.onSite:
        return 'La locatie';
      case WorkMode.hybrid:
        return 'Hibrid';
      case WorkMode.remote:
        return 'La distanta';
    }
  }
}
