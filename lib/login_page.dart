import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Entrar",
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        icon: Icon(Icons.people, size: 16),
                        label: Text('Cadastre-se'),
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/create-user'),
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.replay_rounded, size: 16),
                        label: Text('Esqueceu sua senha ?'),
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/ranking'),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
