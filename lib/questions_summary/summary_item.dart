import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'questions_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(
    this.element, {
    super.key,
  });

  final Map<String, Object> element;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = element['user_answer'] == element['correct_answer'];
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionsIdentifier(
              isCorrectAnswer: isCorrectAnswer,
              questionIndex: element['question_index'] as int),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  element['question'] as String,
                  style: GoogleFonts.lato(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  element['user_answer'] as String,
                  style: TextStyle(color: Colors.purple[100]),
                ),
                Text(
                  element['correct_answer'] as String,
                  style: TextStyle(color: Colors.lightBlue[200]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
