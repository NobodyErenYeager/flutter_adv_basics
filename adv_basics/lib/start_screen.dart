import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(height: 20),
          Text(
            'Learn Flutter the fun way',
            style: GoogleFonts.lato(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
            ),
            onPressed: startQuiz,
            icon: Icon(Icons.arrow_right_alt),
            iconAlignment: IconAlignment.end,
            label: Text('Start Quiz', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
