import 'package:flutter/material.dart';
import 'package:quiz/app_controller.dart';

class Result extends StatefulWidget {
  int rightQuestions;

  // ignore: use_key_in_widget_constructors
  Result({required this.rightQuestions});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Resultado",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal)),
            Text("Você acertou ${widget.rightQuestions}/10",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ElevatedButton(
                onPressed: (() => {print("Pressionando")}),
                child: Text("Retornar"))
          ],
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
                      TextButton.icon(
                        icon: Icon(
                          Icons.people,
                          size: 16,
                          color: AppController.instance.isDartTheme
                              ? Colors.green
                              : Colors.white,
                        ),
                        label: Text(
                          'Editar Perfil',
                          style: TextStyle(
                            color: AppController.instance.isDartTheme
                                ? Colors.green
                                : Colors.white,
                          ),
                        ),
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/edit-user'),
                      ),
                      Container(
                        height: 30,
                      ),
                      ElevatedButton(
                        child: Text('Sair'),
                        onPressed: () =>
                            Navigator.of(context).popAndPushNamed('/'),
                      ),
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
}

// class Result extends StatelessWidget {
//   // static const routeName = "/result";

//   var rigthQuestions;

//   const Result({super.key, required this.rigthQuestions});

//   @override
//   Widget build(BuildContext context) {
//     // final arguments = ModalRoute.of(context)?.settings.arguments as Arguments;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor:
//             AppController.instance.isDartTheme ? Colors.green : Colors.green,
//         title: Text(
//           "Qu!z",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           Row(
//             children: [
//               CustomName(),
//               CustomSwitcher(),
//             ],
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text("Resultado",
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal)),
//             Text("Você acertou $rightQuestions/10",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//             ElevatedButton(
//                 onPressed: (() => {print("Pressionando")}),
//                 child: Text("Retornar"))
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor:
//             AppController.instance.isDartTheme ? Colors.green : Colors.green,
//         child: Icon(
//           Icons.settings,
//         ),
//         onPressed: () {
//           showModalBottomSheet<void>(
//             context: context,
//             builder: (BuildContext context) {
//               return Container(
//                 height: 200,
//                 color: AppController.instance.isDartTheme
//                     ? Colors.black12
//                     : Colors.green,
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       TextButton.icon(
//                         icon: Icon(
//                           Icons.star_rate_rounded,
//                           size: 16,
//                           color: AppController.instance.isDartTheme
//                               ? Colors.green
//                               : Colors.white,
//                         ),
//                         label: Text(
//                           'Ranking',
//                           style: TextStyle(
//                             color: AppController.instance.isDartTheme
//                                 ? Colors.green
//                                 : Colors.white,
//                           ),
//                         ),
//                         onPressed: () =>
//                             Navigator.of(context).pushNamed('/ranking'),
//                       ),
//                       Container(
//                         height: 30,
//                       ),
//                       TextButton.icon(
//                         icon: Icon(
//                           Icons.people,
//                           size: 16,
//                           color: AppController.instance.isDartTheme
//                               ? Colors.green
//                               : Colors.white,
//                         ),
//                         label: Text(
//                           'Editar Perfil',
//                           style: TextStyle(
//                             color: AppController.instance.isDartTheme
//                                 ? Colors.green
//                                 : Colors.white,
//                           ),
//                         ),
//                         onPressed: () =>
//                             Navigator.of(context).pushNamed('/edit-user'),
//                       ),
//                       Container(
//                         height: 30,
//                       ),
//                       ElevatedButton(
//                         child: Text('Sair'),
//                         onPressed: () =>
//                             Navigator.of(context).popAndPushNamed('/'),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//     ;
//   }
// }

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
