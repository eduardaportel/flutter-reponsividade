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
      appBar: AppBar(title: Text("Aplicação responsiva simples")),
      body: LayoutBuilder(builder: (context, constraints){ 
        return constraints.maxWidth <= 576 ? MobileLayout() : Text("Grande"); //ternário
      }),
    );
  }
}

class MobileLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MobileLayoutState();
  }
}

class MobileLayoutState extends State<MobileLayout> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    //TabController: gerencia a seleção de abas e as animações entre elas
    tabController = TabController(length: 2, vsync: this);
  }

  @override Widget build(BuildContext context) {
    return Column(
      children: [
        // TabBar: Widget que exibe uma barra de abas
        TabBar(
          labelColor: Colors.black,
          controller: tabController,
          tabs: [Tab(text: "Aba 1"), Tab(text: 'Aba 2')],
        ),

        Expanded(
          // TabBarView: Widget que exibe o conteúdo de uma aba selecionada
          child: TabBarView(
            controller: tabController,
            children: [
              Center(child: Text("Conteúdo da primeira aba")),
              Center(child: Text("Conteúdo da segunda aba"))
            ],
        ))
      ],
    );
  }
}

class WebLayout extends StatefulWidget { 
  @override
  State<StatefulWidget> createState() {
    return WebLayoutState();
  }
}

// definição do Widget (e de seu estado) para telas maiores.
class WebLayoutState extends State<WebLayout> {
  @override 
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Card(
            child: Center(child: Text("Conteúdo da primeira aba"))  
          )
        ),
        Expanded(
          child: Card(
            child: Center(
              child: Text('Conteúdo da segunda aba'),
            )
          )
        )
      ],
    );
  }
}

