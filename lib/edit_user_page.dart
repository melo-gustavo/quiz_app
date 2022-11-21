import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/app_controller.dart';
import 'package:quiz/home_page.dart';
import 'package:quiz/app_widget.dart';

import 'checagem_page.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUser();
}

class _EditUser extends State<EditUser> {
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  String nome = '';
  String idade = '';
  String email = '';
  String senha = '';

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
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(45.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nome),
                TextFormField(
                  controller: _nomeController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Nome ",
                  ),
                ),
                Container(
                  height: 20,
                ),
                Text(idade),
                TextFormField(
                    controller: _idadeController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Idade",
                    )),
                Container(
                  height: 20,
                ),
                Text(email),
                TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                    )),
                Container(
                  height: 20,
                ),
                Text(senha),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Senha"),
                ),
                Container(
                  height: 30,
                ),
                ElevatedButton(
                    child: Text(
                      "Modificar",
                    ),
                    onPressed: () {
                      atualizarUsuario();
                    }),
                Container(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  pegarUsuario() async {
    User? usuario = await _firebaseAuth.currentUser;
    if (usuario != null) {
      setState(() {
        nome = usuario.displayName!;
        email = usuario.email!;
      });
    }
  }

  atualizarUsuario() async {
    User? usuario = await _firebaseAuth.currentUser;
    if (usuario != null) {
      usuario.updateDisplayName(_nomeController.text);
      usuario.updateEmail(_emailController.text);
      usuario.reload();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChecagemPage()),
          (route) => false);
    }
  }
}
