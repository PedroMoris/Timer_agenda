//
// TELA CONFIGURAÇÕES
//
import 'package:flutter/material.dart';

final List<String> entries = <String>[];
final List<int> colorCodes = <int>[];

class ListaAnotacoes extends StatelessWidget {
  const ListaAnotacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Anotações')),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Título: ${entries[index]}')),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}
