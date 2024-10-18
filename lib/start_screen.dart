import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const startAlignment = Alignment.topCenter;
const endAlignment = Alignment.bottomCenter;

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              color: const Color.fromARGB(150, 239, 232, 232),
              'asset/image/quiz-logo.png'),
          const SizedBox(height: 10.0),
          Text(
              style: GoogleFonts.playfairDisplay(
                  color: Colors.amberAccent, fontSize: 15.0),
              'Learn flutter the fun way!'),
          const SizedBox(height: 10.0),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz!'),
          )
        ],
      ),
    );
  }
}
