import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/app_controller.dart';
import 'package:quiz/home_page.dart';
import 'package:quiz/app_widget.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUser();
}

class _EditUser extends State<EditUser> {
  String name = '';
  int age = 0;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
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
                TextField(
                    onChanged: ((value) {
                      name = value;
                      print(name);
                    }),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Nome",
                    )),
                Container(
                  height: 20,
                ),
                TextField(
                    onChanged: ((value) {
                      age = int.parse(value);
                      print(age);
                    }),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Idade",
                    )),
                Container(
                  height: 20,
                ),
                TextField(
                    onChanged: ((value) {
                      email = value;
                      print(email);
                    }),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                    )),
                Container(
                  height: 20,
                ),
                TextField(
                  onChanged: ((value) {
                    password = value;
                    print(password);
                  }),
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
                      if (email == 'gustavo@gmail.com' && password == '123') {
                        Navigator.of(context).pushReplacementNamed('/home');
                      } else {
                        print("Acesso negado!");
                      }
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
}
