// Exibir "Olá"
mixin DizerOla{
  String ola() {
    return "Olá";
  }
  void quemSouEu(){
    print("Me chamo DizerOla");
  }
}



mixin DizerNome {
  String nome() {
    return "Duda";
  }
  void quemSouEu(){
    print("Me chamo DizerNome");
  }
}

// DizerNome sobre-escreve DizerOla com o with
class OlaNome with DizerOla, DizerNome{ 
  olaNome() {
    print('${ola()}, ${nome()}');
  }
}

void main(){
  var teste = OlaNome();
  teste.olaNome();
  teste.quemSouEu();
}