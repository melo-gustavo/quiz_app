import 'package:flutter/material.dart';
import 'package:quiz/app_controller.dart';
import 'package:quiz/edit_user_page.dart';
import 'package:quiz/login_page.dart';
import 'package:quiz/quiz_page.dart';
import 'package:quiz/ranking_page.dart';
import 'package:quiz/result_page.dart';
import 'checagem_page.dart';

import 'create_user_page.dart';
import 'home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: AppController.instance.isDartTheme
                ? Colors.green
                : Colors.green,
            brightness: AppController.instance.isDartTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => ChecagemPage(),
            '/login': (context) => LoginPage(),
            '/home': (context) => HomePage(),
            '/create-user': (context) => CreateUser(),
            '/ranking': (context) => RankingTable(),
            '/edit-user': (context) => EditUser(),
            '/quiz': (context) => QuizPage(),
            '/result': (context) => Result(),
          },
        );
      },
    );
  }
}
