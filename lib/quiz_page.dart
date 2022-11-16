import 'package:flutter/material.dart';
import 'package:quiz/app_controller.dart';
import 'package:quiz/result_page.dart';

class ScreenArguments {
  final int rightQuestions;
  final int sizeQuestionsQuiz;

  ScreenArguments(this.rightQuestions, this.sizeQuestionsQuiz);
}

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  @override
  List questionsQuiz = [
    {
      "question": "Quem descobriu o Brasil ?",
      "anwsers": [
        "Dom Pedro I",
        "Dom Pedro II",
        "Pedro Alvares Cabral",
        "Tiringa"
      ],
      "correctAnwser": 3
    },
    {
      "question": "Quem descobriu a Espanha ?",
      "anwsers": [
        "Dom Pedro I",
        "Dom Pedro II",
        "Pedro Alvares Cabral",
        "Tiringa"
      ],
      "correctAnwser": 3
    },
    {
      "question": "Quem descobriu a Inglaterra ?",
      "anwsers": [
        "Dom Pedro I",
        "Dom Pedro II",
        "Pedro Alvares Cabral",
        "Tiringa"
      ],
      "correctAnwser": 3
    },
    {
      "question": "Quem descobriu a Franaça ?",
      "anwsers": [
        "Dom Pedro I",
        "Dom Pedro II",
        "Pedro Alvares Cabral",
        "Tiringa"
      ],
      "correctAnwser": 3
    },
    {
      "question": "Quem descobriu a Alemanha ?",
      "anwsers": [
        "Dom Pedro I",
        "Dom Pedro II",
        "Pedro Alvares Cabral",
        "Tiringa"
      ],
      "correctAnwser": 3
    },
    {
      "question": "Quem descobriu o Brasil ?",
      "anwsers": [
        "Dom Pedro I",
        "Dom Pedro II",
        "Pedro Alvares Cabral",
        "Tiringa"
      ],
      "correctAnwser": 3
    },
  ];

  int questionNumber = 1;

  int result = 0;

  int rightQuestions = 0;

  Widget build(BuildContext context) {
    int sizeQuestionsQuiz = questionsQuiz.length;

    void handleAnwser(int questionNumber) {
      if (questionsQuiz[questionNumber - 1]["correctAnwser"] == result) {
        rightQuestions++;
      }
    }

    void finished(int questionNumber) {
      if (questionNumber == sizeQuestionsQuiz) {
        // Navigator.pushReplacementNamed(
        //   context,
        //   '/result',
        // );
        Navigator.of(context).pushReplacementNamed('/result',
            arguments: ScreenArguments(rightQuestions, sizeQuestionsQuiz));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AppController.instance.isDartTheme ? Colors.green : Colors.green,
        title: Text(
          "Qu!z",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
              CustomName(),
              CustomSwitcher(),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Pergunta $questionNumber de $sizeQuestionsQuiz",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              questionsQuiz[questionNumber - 1]["question"],
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = 1;
                      handleAnwser(questionNumber);
                      questionNumber++;
                      finished(questionNumber);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                  child: Text(
                    questionsQuiz[questionNumber - 1]["anwsers"][0],
                    style: TextStyle(fontSize: 19),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = 2;
                      handleAnwser(questionNumber);
                      questionNumber++;
                      finished(questionNumber);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                  child: Text(
                    questionsQuiz[questionNumber - 1]["anwsers"][1],
                    style: TextStyle(fontSize: 19),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = 3;
                      handleAnwser(questionNumber);
                      questionNumber++;
                      finished(questionNumber);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                  child: Text(
                    questionsQuiz[questionNumber - 1]["anwsers"][2],
                    style: TextStyle(fontSize: 19),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = 4;
                      handleAnwser(questionNumber);
                      questionNumber++;
                      finished(questionNumber);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                  child: Text(
                    questionsQuiz[questionNumber - 1]["anwsers"][3],
                    style: TextStyle(fontSize: 19),
                  )),
            ),
          ],
        )),
      ),
    );
  }
}

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      activeColor: Colors.white,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}

class CustomName extends StatelessWidget {
  const CustomName({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        Icons.bedtime, //auto_awesome_outlined
        size: 16,
        color: Colors.white,
      ),
      label: Text(
        "Tema",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {},
    );
  }
}
