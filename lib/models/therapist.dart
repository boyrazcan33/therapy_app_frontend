enum Specialization {
  Anxiety,
  Depression,
  CBT,
  FamilyTherapy,
  Relationships,
  TraumaTherapy,
  PTSD,
  Unknown,
}

class Therapist {
  final String id;
  final String name;
  final List<Specialization> specializations;
  final int experience;
  final double rating;
  final List<String> languages;
  final String bio;
  final List<String> availability;
  final String profileImage;

  Therapist({
    required this.id,
    required this.name,
    required this.specializations,
    required this.experience,
    required this.rating,
    required this.languages,
    required this.bio,
    required this.availability,
    required this.profileImage,
  });

  ///  Convert JSON to Therapist Object (Handles missing fields safely)
  factory Therapist.fromJson(Map<String, dynamic> json) {
    return Therapist(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown',
      specializations: (json['specialization'] as List<dynamic>?)
          ?.map((spec) => _parseSpecialization(spec.toString()))
          .toList() ??
          [],
      experience: (json['experience'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      languages: List<String>.from(json['languages'] ?? []),
      bio: json['bio'] ?? '',
      availability: List<String>.from(json['availability'] ?? []),
      profileImage: json['profileImage'] ?? '',
    );
  }

  ///  Convert Therapist Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specializations.map((s) => s.name).toList(),
      'experience': experience,
      'rating': rating,
      'languages': languages,
      'bio': bio,
      'availability': availability,
      'profileImage': profileImage,
    };
  }

  ///  Private helper function to parse `specialization` safely
  static Specialization _parseSpecialization(String spec) {
    switch (spec.toLowerCase()) {
      case 'anxiety':
        return Specialization.Anxiety;
      case 'depression':
        return Specialization.Depression;
      case 'cbt':
        return Specialization.CBT;
      case 'familytherapy':
        return Specialization.FamilyTherapy;
      case 'relationships':
        return Specialization.Relationships;
      case 'traumatherapy':
        return Specialization.TraumaTherapy;
      case 'ptsd':
        return Specialization.PTSD;
      default:
        return Specialization.Unknown;
    }
  }
}
