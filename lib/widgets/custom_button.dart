import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _buttonStyle(context),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// ✅ Centralized Button Style
  ButtonStyle _buttonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: isPrimary ? Theme.of(context).colorScheme.primary : Colors.white,
      foregroundColor: isPrimary ? Colors.white : Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      side: isPrimary ? BorderSide.none : BorderSide(color: Theme.of(context).colorScheme.primary),
      disabledBackgroundColor: Colors.grey.shade300, // ✅ Disabled state color
      disabledForegroundColor: Colors.grey.shade600,
    );
  }
}
