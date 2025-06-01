import 'dart:math';

void main() {
  List<String> minhaLista = List.generate(99999999, (val) => "name$val");

  int number = 99999998;

  String usuario = "name$number";

  final stopwatch = Stopwatch();
  stopwatch.start();

  int? indexBuscaSimples = getIndexBuscaSimples(minhaLista, usuario);

  print("Tempo Busca Simples: ${stopwatch.elapsedMicroseconds}");

  if (indexBuscaSimples != null) {
    print("A posição do seu item na lista é $indexBuscaSimples");
  } else {
    print("Item não encontrado");
  }

  stopwatch.stop();
  stopwatch.reset();
  stopwatch.start();

  int? index2 = getIndexBUscaBinaria(minhaLista, usuario);

  print("Tempo Busca Binaria: ${stopwatch.elapsedMicroseconds}");

  if (index2 != null) {
    print("A posição do seu item na lista é $index2");
  } else {
    print("Item não encontrado");
  }
}

int? getIndexBUscaBinaria(List<String> list, String value) {
  
  int lower = 0;
  int higher = list.length - 1;
  while (lower <= higher) {
    int meio = ((lower + higher) / 2).toInt();
    
    String palpite = list[meio];

    if (palpite == value) {
      
      return meio;
    }

    if(palpite.compareTo(value) > 0) {
      higher = meio -1;
    } else {
      lower = meio + 1;
    }
  }
  return null;
}

int? getIndexBuscaSimples(List<String> list, String value) {
  for (int c = 0; c < list.length; c++)  {
    if (list[c] == value) {
      
      return c;
    }
  }
  return null;
}

