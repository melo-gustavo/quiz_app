import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app_controller.dart';
import 'package:quiz/checagem_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final _firebaseAuth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    pegarUsuario();
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
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  'Conhecimentos Gerais',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'JOGAR',
                      style: TextStyle(fontSize: 17),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/quiz');
                    },
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            AppController.instance.isDartTheme ? Colors.green : Colors.green,
        child: Icon(
          Icons.settings,
        ),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: AppController.instance.isDartTheme
                    ? Colors.black12
                    : Colors.green,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextButton.icon(
                        icon: Icon(
                          Icons.star_rate_rounded,
                          size: 16,
                          color: AppController.instance.isDartTheme
                              ? Colors.green
                              : Colors.white,
                        ),
                        label: Text(
                          'Ranking',
                          style: TextStyle(
                            color: AppController.instance.isDartTheme
                                ? Colors.green
                                : Colors.white,
                          ),
                        ),
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/ranking'),
                      ),
                      Container(
                        height: 30,
                      ),
                      ElevatedButton(
                          child: Text('Sair'),
                          onPressed: () {
                            sair();
                          }),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  pegarUsuario() async {
    User? usuario = await _firebaseAuth.currentUser;
    if (usuario != null) {
      print(usuario);
      print(usuario.uid);
    }
  }

  sair() async {
    _firebaseAuth.signOut().then((user) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ChecagemPage())));
  }
}

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      activeColor: Colors.green,
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

class ElevatedCardExample extends StatelessWidget {
  final String title;
  const ElevatedCardExample({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text(title)),
        ),
      ),
    );
  }
}
