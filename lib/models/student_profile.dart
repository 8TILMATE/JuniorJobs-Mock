class StudentProfile {
  const StudentProfile({
    required this.name,
    required this.headline,
    required this.school,
    required this.city,
    required this.videoCvStatus,
    required this.skills,
    required this.portfolioItems,
  });

  final String name;
  final String headline;
  final String school;
  final String city;
  final String videoCvStatus;
  final List<String> skills;
  final List<String> portfolioItems;

  StudentProfile copyWith({
    String? name,
    String? headline,
    String? school,
    String? city,
    String? videoCvStatus,
    List<String>? skills,
    List<String>? portfolioItems,
  }) {
    return StudentProfile(
      name: name ?? this.name,
      headline: headline ?? this.headline,
      school: school ?? this.school,
      city: city ?? this.city,
      videoCvStatus: videoCvStatus ?? this.videoCvStatus,
      skills: skills ?? this.skills,
      portfolioItems: portfolioItems ?? this.portfolioItems,
    );
  }
}
