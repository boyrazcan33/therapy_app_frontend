import 'package:flutter/material.dart';
import 'dart:math';

class MotivationScreen extends StatelessWidget {
  MotivationScreen({Key? key}) : super(key: key);

  final List<String> quotes = [
    "Your mental health matters!",
    "One small step today leads to a better tomorrow.",
    "Self-care isn't selfish. It's necessary.",
    "You are enough. Always.",
    "Every storm runs out of rain.",
    "Your feelings are valid, and so are you.",
  ];

  ///  Get a random quote
  String getRandomQuote() {
    final random = Random();
    return quotes[random.nextInt(quotes.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daily Motivation")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getRandomQuote(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Image.asset(
                "assets/images/motivation-background.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
