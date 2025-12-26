import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.restartQuiz,
  });

  final List<String> chosenAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> getChosenAnswer() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "chosen_answer": chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getChosenAnswer();
    final totalQuestions = summaryData.length;
    final totalCorrectAnswers = summaryData.where((data) {
      return data['chosen_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You have answered $totalCorrectAnswers out of $totalQuestions answers correctly!",
              style: GoogleFonts.shareTechMono(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionSummary(getChosenAnswer()),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: restartQuiz,
              label: Text("Restart Quiz"),
              icon: Icon(Icons.replay),
              iconAlignment: IconAlignment.start,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
