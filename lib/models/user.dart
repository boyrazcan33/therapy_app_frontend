enum LanguagePreference { English, Estonian, Latvian, Lithuanian, Russian, Unknown }

class User {
  final String id;
  final String email;
  final String anonymizedName; // ✅ Defaulted to "AnonymousUser"
  final LanguagePreference languagePreference;
  final List<String> therapyGoals;

  User({
    required this.id,
    required this.email,
    this.anonymizedName = "AnonymousUser", // ✅ Provide a default name
    required this.languagePreference,
    required this.therapyGoals,
  });

  /// ✅ Convert JSON to User Object (Handles missing fields safely)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      anonymizedName: json['anonymizedName'] ?? "AnonymousUser", // ✅ Handle null safety
      languagePreference: _parseLanguage(json['languagePreference']),
      therapyGoals: List<String>.from(json['therapyGoals'] ?? []), // ✅ Ensure it handles null lists
    );
  }

  /// ✅ Convert User Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'anonymizedName': anonymizedName,
      'languagePreference': languagePreference.name, // ✅ Store enum as string
      'therapyGoals': therapyGoals,
    };
  }

  /// ✅ Private helper function to parse `languagePreference` safely
  static LanguagePreference _parseLanguage(String? lang) {
    switch (lang?.toLowerCase()) {
      case 'english':
        return LanguagePreference.English;
      case 'estonian':
        return LanguagePreference.Estonian;
      case 'latvian':
        return LanguagePreference.Latvian;
      case 'lithuanian':
        return LanguagePreference.Lithuanian;
      case 'russian':
        return LanguagePreference.Russian;
      default:
        return LanguagePreference.Unknown;
    }
  }
}
