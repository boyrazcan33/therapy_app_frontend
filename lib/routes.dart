import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'pages/login_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/how_to_use_page.dart';
import 'pages/therapist_profile_page.dart';
import 'pages/booking_confirmation_page.dart';
import 'pages/set_appointment_page.dart';
import 'pages/match_with_therapist_page.dart';
import 'pages/matching_questionnaire_page.dart';
import 'pages/motivation_screen.dart';
import 'pages/payment_options_page.dart';
import '../data/mock_data.dart';

///  Centralized Route Names
class Routes {
  static const String welcome = '/';
  static const String login = '/login';
  static const String signUp = '/sign_up';
  static const String howToUse = '/how_to_use';
  static const String therapistProfile = '/therapist_profile';
  static const String bookingConfirmation = '/booking_confirmation';
  static const String setAppointment = '/set_appointment';
  static const String matchWithTherapist = '/match_with_therapist';
  static const String matchingQuestionnaire = '/matching_questionnaire';
  static const String motivationScreen = '/motivation_screen';
  static const String paymentOptions = '/payment_options';
}

///  Static Routes (For pages that don't require arguments)
final Map<String, WidgetBuilder> appRoutes = {
  Routes.welcome: (context) => const WelcomePage(),
  Routes.login: (context) => const LogInPage(),
  Routes.signUp: (context) => const SignUpPage(),
  Routes.howToUse: (context) => const HowToUsePage(),
  Routes.matchingQuestionnaire: (context) => const MatchingQuestionnairePage(),
  Routes.motivationScreen: (context) =>  MotivationScreen(),
  Routes.paymentOptions: (context) => const PaymentOptionsPage(),
};

///  Dynamic Routes (For pages that need arguments)
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

  //  Therapist Profile Page (Fixes missing arguments)
    case Routes.therapistProfile:
      final therapistData = settings.arguments as Map<String, dynamic>? ?? mockTherapists[0];
      return MaterialPageRoute(
        builder: (context) => TherapistProfilePage(
          name: therapistData['name'] ?? 'Unknown',
          bio: therapistData['bio'] ?? 'No bio available',
          imagePath: therapistData['profileImage'] ?? 'assets/images/default_therapist.png',
          rating: (therapistData['rating'] ?? 0.0).toDouble(),
          experience: therapistData['experience'] ?? 0,
          specialization: List<String>.from(therapistData['specialization'] ?? []),
          languages: List<String>.from(therapistData['languages'] ?? []),
        ),
      );

  //  Set Appointment Page (Fixes missing arguments)
    case Routes.setAppointment:
      final appointmentData = settings.arguments as Map<String, dynamic>? ?? {};
      return MaterialPageRoute(
        builder: (context) => SetAppointmentPage(
          appointmentDate: appointmentData['appointmentDate'] ?? DateTime.now(),
          therapistName: appointmentData['therapistName'] ?? "Unknown Therapist",
        ),
      );

  // Match With Therapist Page (Fixes missing arguments)
    case Routes.matchWithTherapist:
      final matchData = settings.arguments as Map<String, dynamic>? ?? {};
      return MaterialPageRoute(
        builder: (context) => MatchWithTherapistPage(
          therapistName: matchData['therapistName'] ?? "No Match Found",
          matchPercentage: (matchData['matchPercentage'] ?? 0).toDouble(),
          specialization: List<String>.from(matchData['specialization'] ?? []),
          experience: matchData['experience'] ?? 0,
          imagePath: matchData['imagePath'] ?? 'assets/images/default_therapist.png',
        ),
      );

  //  Booking Confirmation Page (Fixes missing arguments)
    case Routes.bookingConfirmation:
      final bookingData = settings.arguments as Map<String, dynamic>? ?? {};
      return MaterialPageRoute(
        builder: (context) => BookingConfirmationPage(
          therapistName: bookingData['therapistName'] ?? "Unknown Therapist",
          appointmentDate: bookingData['appointmentDate'] ?? DateTime.now(),
        ),
      );

    default:
      return MaterialPageRoute(builder: (context) => const WelcomePage());
  }
}
