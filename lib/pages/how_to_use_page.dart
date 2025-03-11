import 'package:flutter/material.dart';

class HowToUsePage extends StatelessWidget {
  const HowToUsePage({Key? key}) : super(key: key);

  final List<Map<String, String>> _steps = const [
    {"title": "Step 1", "description": "Sign up with your email or anonymously."},
    {"title": "Step 2", "description": "Complete a short questionnaire to personalize your experience."},
    {"title": "Step 3", "description": "Get matched with the best therapist for your needs."},
    {"title": "Step 4", "description": "Book a session and start your journey to mental wellness!"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("How OnnJoy Works")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: _steps.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final step = _steps[index];
            return _buildStepCard(context, step["title"]!, step["description"]!);
          },
        ),
      ),
    );
  }

  ///  Step Card UI
  Widget _buildStepCard(BuildContext context, String title, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              title.split(" ").last, // Extract step number
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(description, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
    );
  }
}
