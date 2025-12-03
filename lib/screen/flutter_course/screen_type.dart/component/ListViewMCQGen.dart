import 'package:flutter/material.dart';
import 'package:fluttertutorial/custom/option_text.dart';
import 'package:fluttertutorial/custom/question_text.dart';

class ListViewMCQGen extends StatefulWidget {

  final Map<String, dynamic> content;

  const ListViewMCQGen(this.content, {super.key});

  @override
  State<ListViewMCQGen> createState() => _ListViewMCQGenState();
}

class _ListViewMCQGenState extends State<ListViewMCQGen> {

  int currentQuestionIndex = 0;
  String? selectedOption;
  bool? isCorrect;

  @override
  Widget build(BuildContext context) {

    final question = widget.content["question"];
    final options = widget.content["option"];
    final correctAnswer = widget.content["ans"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionText(questionText: question),
        ...options.map((optionText) {
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedOption = optionText;
                isCorrect = optionText == correctAnswer;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: EdgeInsets.only(left: 20, top: 5),
              decoration: BoxDecoration(
                color: selectedOption == optionText
                ? (
                  isCorrect == true ? Colors.green.withOpacity(0.5)
                  : Colors.red.withOpacity(0.5)
                )
                : Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8)
              ),
              child: OptionText(optionText: optionText,),
            ),
          );
        }).toList(),
        if (selectedOption != null)
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              isCorrect == true
                  ? "Correct Answer!"
                  : "Wrong Answer. Correct: $correctAnswer",
              style: TextStyle(
                color: isCorrect == true ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ], 
    );   
  }
}