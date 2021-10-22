import 'package:flutter/material.dart';

import '../main.dart';

final TextEditingController nomeusuario = TextEditingController();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

void _entrar(context, _nome) {
  Navigator.pushNamed(context, '/homepage');
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('../../imagens/logo.png', width: 150, height: 150),
                Divider(),
                TextField(
                    autofocus: true,
                    controller: nomeusuario,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                    decoration: InputDecoration(
                      labelText: "Usuário",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                TextField(
                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                ButtonTheme(
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () => _entrar(context, nomeusuario.text),
                    child: Text(
                      "Enviar",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
