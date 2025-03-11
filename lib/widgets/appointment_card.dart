import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentCard extends StatelessWidget {
  final String therapistName;
  final DateTime appointmentDate;
  final VoidCallback onCancel;

  const AppointmentCard({
    Key? key,
    required this.therapistName,
    required this.appointmentDate,
    required this.onCancel,
  }) : super(key: key);

  /// ✅ Format date and time using `intl` package
  String get formattedDate => DateFormat.yMMMd().format(appointmentDate);
  String get formattedTime => DateFormat.jm().format(appointmentDate); // 12-hour format

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Therapist: $therapistName",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "Date: $formattedDate",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Time: $formattedTime",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onCancel,
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text("Cancel"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
