import 'package:flutter/material.dart';

class ResultsSumm extends StatelessWidget {
  const ResultsSumm(this.summ, {super.key});
  final List<Map<String, Object>> summ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summ.map((data) {
            return Row(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                margin: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: data['user_ans'] == data['correct_ans']
                      ? Colors.green
                      : Colors.red,
                ),
                child: Text(((data['question_index'] as int) + 1).toString()),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        data['question'] as String),
                    const SizedBox(height: 5.0),
                    Text(
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                        data['user_ans'] as String),
                    const SizedBox(height: 5.0),
                    Text(
                        style: const TextStyle(
                          color: Colors.green,
                        ),
                        data['correct_ans'] as String),
                  ],
                ),
              )
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
