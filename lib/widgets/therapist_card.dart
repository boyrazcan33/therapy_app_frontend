import 'package:flutter/material.dart';
import '../utils/constants.dart'; // Import Constants for default image

class TherapistCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String? imageUrl;
  final VoidCallback onPressed;

  const TherapistCard({
    Key? key,
    required this.name,
    required this.specialty,
    this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundImage: AssetImage(imageUrl ?? Constants.defaultTherapistImage),
          radius: 30,
          backgroundColor: Colors.grey.shade300, // Placeholder color
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          specialty,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.teal),
          onPressed: onPressed,
        ),
        onTap: onPressed,
      ),
    );
  }
}
