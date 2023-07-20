import 'package:flutter/material.dart';

class QuestionsIdentifier extends StatelessWidget {
  const QuestionsIdentifier({super.key, required this.isCorrectAnswer, required this.questionIndex});
  final bool isCorrectAnswer;
  final int questionIndex;



  @override
  Widget build(BuildContext context) {
    final questionNumber= questionIndex + 1;
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer? Colors.lightBlue[300] : Colors.purpleAccent[100],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(questionNumber.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}
