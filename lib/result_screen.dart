import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_summ.dart';
import 'package:quiz_app/start_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedans, this.switchScreen, {super.key});
  final List<String> selectedans;
  final void Function() switchScreen;
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedans.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_ans': questions[i].answers[0],
        'user_ans': selectedans[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summData = getSummaryData();
    final total = questions.length;
    final correct = summData.where((data) {
      return data['user_ans'] == data['correct_ans'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            'You have selected $correct out of $total answers correctly!',
          ),
          ResultsSumm(summData),
          TextButton.icon(
              onPressed: switchScreen,
              icon: const Icon(Icons.restart_alt, color: Colors.white),
              label: const Text(
                  style: TextStyle(color: Colors.white), 'Restart Quiz!'))
        ]),
      ),
    );
  }
}
