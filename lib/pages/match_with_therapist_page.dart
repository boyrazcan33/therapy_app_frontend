import 'package:flutter/material.dart';
import '../routes.dart';
import '../widgets/custom_button.dart';

class MatchWithTherapistPage extends StatelessWidget {
  final String therapistName;
  final double matchPercentage;
  final List<String> specialization;
  final int experience; // Define the experience parameter
  final String imagePath;

  const MatchWithTherapistPage({
    Key? key,
    required this.therapistName,
    required this.matchPercentage,
    required this.specialization,
    required this.experience, // Make the experience parameter required
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Match with a Therapist")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Based on your questionnaire, we recommend:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Text(
              "$therapistName (${matchPercentage.toStringAsFixed(1)}% match)",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: "View Profile",
              onPressed: () => Navigator.pushNamed(context, Routes.therapistProfile),
            ),
          ],
        ),
      ),
    );
  }
}
