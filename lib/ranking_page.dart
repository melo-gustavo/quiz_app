import 'package:flutter/material.dart';
import 'package:quiz/app_controller.dart';

class RankingTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RankingTableState();
  }
}

class RankingTableState extends State<RankingTable> {
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
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Text(
            'Melhores Jogadores',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: DataTable(
            columns: [
              DataColumn(
                  label: Text('Nome',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Acertos',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Tempo',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Stephen')),
                DataCell(Text('10')),
                DataCell(Text('2 min')),
              ]),
              DataRow(cells: [
                DataCell(Text('Maluco')),
                DataCell(Text('9')),
                DataCell(Text('3 min')),
              ]),
              DataRow(cells: [
                DataCell(Text('Jane')),
                DataCell(Text('8')),
                DataCell(Text('4 min')),
              ]),
              DataRow(cells: [
                DataCell(Text('Carinha que mora logo ali')),
                DataCell(Text('7')),
                DataCell(Text('5 min')),
              ]),
            ],
          ),
        ),
      ]),
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
                        onPressed: () => Navigator.pop(context),
                      ),
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
