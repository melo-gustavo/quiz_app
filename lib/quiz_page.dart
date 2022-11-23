import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _firebaseAuth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  List allQuestao = [];

  initialise() {
    listarQuestao().then((value) => {
          setState(() => {allQuestao = value!})
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  int questionNumber = 0;

  String result = "";

  int rightQuestions = 0;

  Widget build(BuildContext context) {
    int sizeQuestionsQuiz = 0;

    void handleAnwser(int questionNumber) {
      if (allQuestao[questionNumber]["resposta_correta"] == result) {
        rightQuestions++;
      }
    }

    void finished(int questionNumber) {
      if (questionNumber == allQuestao.length) {
        Navigator.of(context).pushReplacementNamed('/result',
            arguments: ScreenArguments(rightQuestions, allQuestao.length));
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
              "Pergunta $questionNumber de ${allQuestao.length}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              allQuestao[questionNumber]['nome'],
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = "0";
                      handleAnwser(questionNumber);
                      questionNumber++;
                      finished(questionNumber);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                  child: Text(
                    allQuestao[questionNumber]["resposta_a"],
                    style: TextStyle(fontSize: 19),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = "1";
                      handleAnwser(questionNumber);
                      questionNumber++;
                      finished(questionNumber);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                  child: Text(
                    allQuestao[questionNumber]["resposta_b"],
                    style: TextStyle(fontSize: 19),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = "2";
                      handleAnwser(questionNumber);
                      questionNumber++;
                      finished(questionNumber);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                  child: Text(
                    allQuestao[questionNumber]["resposta_c"],
                    style: TextStyle(fontSize: 19),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = "3";
                      handleAnwser(questionNumber);
                      questionNumber++;
                      finished(questionNumber);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                  child: Text(
                    allQuestao[questionNumber]["resposta_d"],
                    style: TextStyle(fontSize: 19),
                  )),
            ),
          ],
        )),
      ),
    );
  }

  listarQuestao() async {
    User? usuario = await _firebaseAuth.currentUser;
    if (usuario != null) {
      QuerySnapshot querySnapshot;

      List listQuestao = [];

      try {
        querySnapshot = await _db.collection('questions').get();

        if (querySnapshot.docs.isNotEmpty) {
          for (var questao in querySnapshot.docs.toList()) {
            Map addQuestao = {
              "nome": questao['nome'],
              "resposta_correta": questao['resposta_correta'],
              "resposta_a": questao['respostas'][0],
              "resposta_b": questao['respostas'][1],
              "resposta_c": questao['respostas'][2],
              "resposta_d": questao['respostas'][3],
            };
            listQuestao.add(addQuestao);
          }
          return listQuestao;
        }
      } catch (error) {}
    }
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
