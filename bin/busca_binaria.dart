import 'dart:math';

void main() {
  List<Usuario> minhaLista = List.generate(100000001, (val) => Usuario(val, "Luan", "012345678910", true));

  Usuario usuario = Usuario(100000000, "Luan", "012345678910", true);

  print(usuario.id);

  int? indexBuscaSimples = getIndexBuscaSimples(minhaLista, usuario);

  if (indexBuscaSimples != null) {
    print("A posição do seu item na lista é $indexBuscaSimples");
  } else {
    print("Item não encontrado");
  }
  int? index2 = getIndexBUscaBinaria(minhaLista, usuario);

  if (index2 != null) {
    print("A posição do seu item na lista é $index2");
  } else {
    print("Item não encontrado");
  }
}

int? getIndexBUscaBinaria(List<Usuario> list, Usuario value) {
  final stopwatch = Stopwatch();
  stopwatch.start();
  int lower = 0;
  int higher = list.length - 1;
  while (lower <= higher) {
    int meio = ((lower + higher) / 2).toInt();
    
    Usuario palpite = list[meio];

    if (palpite.id == value.id) {
      print("Tempo Busca Binaria: ${stopwatch.elapsedMicroseconds}");
      return meio;
    }

    if(palpite.id > value.id) {
      higher = meio -1;
    } else {
      lower = meio + 1;
    }
  }
  print("Tempo Busca Binaria: ${stopwatch.elapsedMicroseconds}");
  return null;
}

int? getIndexBuscaSimples(List<Usuario> list, Usuario value) {
  final stopwatch = Stopwatch();
  stopwatch.start();
  for (int c = 0; c < list.length; c++)  {
    if (list[c].id == value.id) {
      print("Tempo Busca Simples: ${stopwatch.elapsedMicroseconds}");
      return c;
    }
  }
  print("Tempo Busca Simples: ${stopwatch.elapsedMicroseconds}");
  return null;
}

class Usuario {
  Usuario(this.id, this.nome, this.cpf, this.isAtivo);

  final int id;
  final String nome;
  final String cpf;
  final bool isAtivo;
}