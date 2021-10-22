import 'package:flutter/material.dart';

import 'Lista.dart';

class Anotacao extends StatefulWidget {
  @override
  AnotacaoState createState() {
    return new AnotacaoState();
  }
}

enum Prioridade { maxima, normal }

// ...

Prioridade? _prioridade = Prioridade.normal;

class AnotacaoState extends State<Anotacao> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _textoController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  @override
  void didChangeDependencies() {
    /* if (widget.anotacaoModo == AnotacaoModo.Editar){
      _tituloController.text = widget.anotacao['titulo'];
      _textoController.text = widget.anotacao['texto'];
      _dataController.text = widget.anotacao['data_criacao'];
    }*/

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Anotação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                hintText: 'Titulo',
              ),
            ),
            Container(
              height: 8,
            ),
            TextField(
              controller: _textoController,
              decoration: InputDecoration(
                hintText: 'Texto',
              ),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Normal'),
                  leading: Radio<Prioridade>(
                    value: Prioridade.normal,
                    groupValue: _prioridade,
                    onChanged: (Prioridade? value) {
                      setState(() {
                        _prioridade = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Máxima'),
                  leading: Radio<Prioridade>(
                    value: Prioridade.maxima,
                    groupValue: _prioridade,
                    onChanged: (Prioridade? value) {
                      setState(() {
                        _prioridade = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _AnotacaoButton('Guardar', Colors.purple, () {
                  final titulo = _tituloController.text;
                  final texto = _textoController.text;
                      entries.add(titulo + '\n' + texto);
                      _prioridade == Prioridade.maxima
                          ? colorCodes.add(700)
                          : colorCodes.add(100);
                  _tituloController.text = '';
                  _textoController.text = '';
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Cronômetro'),
                            content: Text(
                                'Nota salva com sucesso!\nCheque a lista para conferir suas notas.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ));
                  Navigator.pop(context);
                }),
                Container(
                  height: 16,
                ),
                _AnotacaoButton('Cancelar', Colors.grey, () {
                  Navigator.pop(context);
                }),
                Container(
                  height: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AnotacaoButton extends StatelessWidget {
  final String _texto;
  final Color _cor;
  final _onPressed;

  _AnotacaoButton(this._texto, this._cor, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        _texto,
        style: TextStyle(color: Colors.white),
      ),
      height: 40,
      minWidth: 80,
      color: _cor,
      onPressed: _onPressed,
    );
  }
}
