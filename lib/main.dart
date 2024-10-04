import 'package:flutter/material.dart';
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação responsiva',
      theme: ThemeData(
        primarySwatch: Colors.blue //swatch: a sample
      ),
      home: MeuLayoutResponsivo(),
    );
  }
}


// - MeuLayoutResponsivo: utiliza a classe LayoutBuilder para decidir qual Widget exibir em função da largura da tela.
class MeuLayoutResponsivo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aplicação responvidade")),
      body: LayoutBuilder(builder: (context, constraints){ 
        return constraints.maxWidth <= 576 ? Text("Pequena") : Text("Grande"); //ternário
      }),
    );
  }
}
