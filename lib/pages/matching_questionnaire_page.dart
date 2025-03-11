import 'package:flutter/material.dart';
import '../routes.dart';
import '../widgets/custom_button.dart';

class MatchingQuestionnairePage extends StatefulWidget {
  const MatchingQuestionnairePage({Key? key}) : super(key: key);

  @override
  _MatchingQuestionnairePageState createState() => _MatchingQuestionnairePageState();
}

class _MatchingQuestionnairePageState extends State<MatchingQuestionnairePage> {
  final Map<String, bool> _therapyGoals = {
    "Reduce Anxiety": false,
    "Manage Stress": false,
    "Improve Relationships": false,
  };

  ///  Handle submission
  void _submit() {
    final selectedGoals = _therapyGoals.entries.where((goal) => goal.value).map((e) => e.key).toList();
    if (selectedGoals.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select at least one therapy goal")),
      );
      return;
    }

    // TODO: Save selectedGoals and pass it to the next screen
    Navigator.pushNamed(context, Routes.matchWithTherapist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Questionnaire")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "What are your therapy goals?",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            ..._therapyGoals.keys.map((goal) => CheckboxListTile(
              title: Text(goal),
              value: _therapyGoals[goal],
              onChanged: (val) {
                setState(() {
                  _therapyGoals[goal] = val ?? false;
                });
              },
            )),
            const SizedBox(height: 20),
            CustomButton(
              text: "Submit",
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
