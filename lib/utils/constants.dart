class Constants {
  /// ✅ Base URL for API Endpoints
  static const String baseUrl = "https://api.onnjoy.com";

  /// ✅ API Endpoints
  static const Map<String, String> APIEndpoints = {
    "auth": "$baseUrl/auth",
    "therapists": "$baseUrl/therapists",
    "appointments": "$baseUrl/appointments",
    "payments": "$baseUrl/payments",
    "matching": "$baseUrl/matching",
  };

  /// ✅ Default Assets
  static const String defaultTherapistImage = "assets/images/default_therapist.png";

  /// ✅ Payment Plans
  static const List<Map<String, dynamic>> paymentPlans = [
    {
      "title": "Single Session",
      "price": "€29",
      "description": "One-time 20-minute therapy session.",
    },
    {
      "title": "Monthly Wellness Pack",
      "price": "€89",
      "description": "4 therapy sessions per month (€22/session).",
    },
    {
      "title": "Monthly Intensive Boost",
      "price": "€159",
      "description": "8 therapy sessions per month (€20/session).",
    }
  ];

  /// ✅ Supported Languages (Using `Set` for efficiency)
  static const Set<String> supportedLanguages = {"English", "Estonian", "Latvian", "Lithuanian", "Russian"};

  /// ✅ Anonymity Name Generator Data
  static const List<String> colors = [
    "Azure", "Crimson", "Emerald", "Golden", "Indigo", "Ivory", "Onyx", "Sapphire", "Teal", "Violet"
  ];

  static const List<String> animals = [
    "Falcon", "Panther", "Owl", "Wolf", "Tiger", "Bear", "Fox", "Hawk", "Lynx", "Eagle"
  ];
}
