import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app_controller.dart';

class RankingTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RankingTableState();
  }
}

class RankingTableState extends State<RankingTable> {
  final _firebaseAuth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  List allRanking = [];

  initialise() {
    listarRanking().then((value) => {
          setState(() => {allRanking = value!, print(allRanking)})
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

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
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Melhores Jogadores",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Table(
                border: TableBorder.all(width: 1.0, color: Colors.black),
                children: [
                  for (var ranking in allRanking)
                    TableRow(children: [
                      TableCell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(ranking['nome']),
                          ],
                        ),
                      ),
                      TableCell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(ranking['score'].toString()),
                          ],
                        ),
                      )
                    ])
                ]),
          ),
        ],
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
                      Container(
                        height: 30,
                      ),
                      ElevatedButton(
                        child: Text('Sair'),
                        onPressed: () => Navigator.pop(context),
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

  listarRanking() async {
    User? usuario = await _firebaseAuth.currentUser;
    if (usuario != null) {
      QuerySnapshot querySnapshot;

      List listRanking = [];

      try {
        querySnapshot = await _db
            .collection('ranking')
            .orderBy('score', descending: true)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          for (var ranking in querySnapshot.docs.toList()) {
            Map addRanking = {
              "nome": ranking['nome'],
              "score": ranking['score']
            };
            listRanking.add(addRanking);
          }
          return listRanking;
        }
      } catch (error) {
        print(error);
      }
    }
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
