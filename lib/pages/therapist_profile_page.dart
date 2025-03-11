import 'package:flutter/material.dart';
import '../routes.dart';
import '../widgets/custom_button.dart';

class TherapistProfilePage extends StatelessWidget {
  final String name;
  final List<String> specialization; // Adjusted to List<String>
  final String imagePath;
  final int experience;
  final double rating;
  final List<String> languages;
  final String bio;

  const TherapistProfilePage({
    Key? key,
    required this.name,
    required this.specialization, // Adjusted to List<String>
    required this.imagePath,
    required this.experience,
    required this.rating,
    required this.languages,
    required this.bio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Therapist Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imagePath, width: 120, height: 120, fit: BoxFit.cover),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              specialization.join(', '), // Joining list items for display
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              "$experience years of experience",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text("$rating", style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "Languages: ${languages.join(', ')}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Book Appointment",
              onPressed: () => Navigator.pushNamed(context, Routes.setAppointment),
            ),
          ],
        ),
      ),
    );
  }
}
