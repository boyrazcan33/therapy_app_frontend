import 'package:flutter/material.dart';

class BookingConfirmationPage extends StatelessWidget {
  final String therapistName;
  final DateTime appointmentDate;

  const BookingConfirmationPage({
    Key? key,
    required this.therapistName,
    required this.appointmentDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = "${appointmentDate.day} ${_monthName(appointmentDate.month)}, ${appointmentDate.year}";

    return Scaffold(
      appBar: AppBar(title: const Text("Booking Confirmed")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 16),
            Text(
              "Your session with $therapistName is confirmed!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
              "Date: $formattedDate",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Helper method to format month name
  String _monthName(int month) {
    const months = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    return months[month - 1];
  }
}
