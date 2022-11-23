import 'package:flutter/material.dart';
import 'package:quiz/app_controller.dart';
import 'package:quiz/quiz_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  static const routeName = '/result';

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final _firebaseAuth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Resultado",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal)),
            Text(
                "Você acertou ${args.rightQuestions}/${args.sizeQuestionsQuiz}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ElevatedButton(
                onPressed: (() => {
                      cadastrarJogada(args.rightQuestions),
                      Navigator.pushNamed(context, '/home')
                    }),
                child: Text("Retornar"))
          ],
        ),
      ),
    );
  }

  cadastrarJogada(int certas) async {
    User? usuario = await _firebaseAuth.currentUser;
    String questoesCertas = certas.toString();
    if (usuario != null) {
      String id = usuario.uid;
      String? nome = usuario.displayName;

      await _db
          .collection("ranking")
          .add({"score": questoesCertas, "id_usuario": id, "nome": nome});
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
