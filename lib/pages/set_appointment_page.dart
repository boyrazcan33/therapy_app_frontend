import 'package:flutter/material.dart';
import '../routes.dart';
import '../widgets/custom_button.dart';

class SetAppointmentPage extends StatefulWidget {

  final DateTime appointmentDate;
  final String therapistName;

  const SetAppointmentPage({
    Key? key,
    required this.appointmentDate,
    required this.therapistName,
  }) : super(key: key);

  @override
  _SetAppointmentPageState createState() => _SetAppointmentPageState();
}

class _SetAppointmentPageState extends State<SetAppointmentPage> {
  String? selectedSlot;

  /// Example available time slots (can be dynamically loaded from backend)
  final List<String> _timeSlots = [
    "10:00 AM - 10:45 AM",
    "11:00 AM - 11:45 AM",
    "2:00 PM - 2:45 PM",
    "4:00 PM - 4:45 PM",
  ];

  /// Handles Appointment Confirmation
  void _confirmAppointment() {
    if (selectedSlot == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a time slot")),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Appointment"),
        content: Text("Your selected time: $selectedSlot"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          CustomButton(
            text: "Confirm",
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Routes.bookingConfirmation);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Set Appointment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Select a time slot:",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: _timeSlots.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final slot = _timeSlots[index];
                  return ListTile(
                    title: Text(slot),
                    leading: Radio<String>(
                      value: slot,
                      groupValue: selectedSlot,
                      onChanged: (value) {
                        setState(() {
                          selectedSlot = value;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        selectedSlot = slot;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Confirm Appointment",
              onPressed: _confirmAppointment,
            ),
          ],
        ),
      ),
    );
  }
}
