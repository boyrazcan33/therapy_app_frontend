class Therapist {
  final String id;
  final String name;
  final List<String> specializations; // ✅ Corrected field name
  final int experience;
  final double rating;
  final List<String> languages;
  final String bio;
  final List<String> availability;
  final String profileImage;

  Therapist({
    required this.id,
    required this.name,
    required this.specializations, // ✅ Fixed (was missing)
    required this.experience,
    required this.rating,
    required this.languages,
    required this.bio,
    required this.availability,
    required this.profileImage,
  });

  // ✅ Convert JSON to Therapist Object
  factory Therapist.fromJson(Map<String, dynamic> json) {
    return Therapist(
      id: json['id'],
      name: json['name'],
      specializations: List<String>.from(json['specialization'] ?? []), // ✅ Fixed field name
      experience: json['experience'],
      rating: (json['rating'] as num).toDouble(),
      languages: List<String>.from(json['languages'] ?? []),
      bio: json['bio'],
      availability: List<String>.from(json['availability'] ?? []),
      profileImage: json['profileImage'],
    );
  }

  // ✅ Convert Therapist Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specializations, // ✅ Fixed field name
      'experience': experience,
      'rating': rating,
      'languages': languages,
      'bio': bio,
      'availability': availability,
      'profileImage': profileImage,
    };
  }
}
