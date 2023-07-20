import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly', textAlign: TextAlign.center, style: GoogleFonts.lato(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold,),),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData),
              const SizedBox(height: 30),
              TextButton.icon(onPressed:onRestart, style: TextButton.styleFrom(foregroundColor: Colors.white), icon: const Icon(Icons.refresh), label: const Text('Restart Quiz'), )
            ],
          )),
    );
  }
}
