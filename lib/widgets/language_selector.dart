import 'package:flutter/material.dart';
import '../utils/constants.dart'; // Import Constants file for supported languages

class LanguageSelector extends StatelessWidget {
  final String selectedLanguage;
  final Function(String) onLanguageChanged;

  const LanguageSelector({
    Key? key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedLanguage,
      decoration: InputDecoration(
        labelText: "Select Language",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      ),
      items: Constants.supportedLanguages
          .map((language) => DropdownMenuItem(
        value: language,
        child: Text(language),
      ))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          onLanguageChanged(value);
        }
      },
    );
  }
}
