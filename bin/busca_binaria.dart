import 'dart:io';

void main() {
  List<int> minhaLista = List.generate(1000000001, (val) => val);

  int inputNumber = getNUmber();


  int? indexBuscaSimples = getIndexBuscaSimples(minhaLista, inputNumber);

  if (indexBuscaSimples != null) {
    print("A posição do seu item na lista é $indexBuscaSimples");
  } else {
    print("Item não encontrado");
  }
  int? index2 = getIndexBUscaBinaria(minhaLista, inputNumber);

  if (index2 != null) {
    print("A posição do seu item na lista é $index2");
  } else {
    print("Item não encontrado");
  }
}

int getNUmber() {
  while (true) {
    print("Digite um número de 0 a 1000000000");
    try {
      String? input = stdin.readLineSync();
      int? number = int.tryParse(input ?? "");
      if (number != null && number >= 0 && number <= 1000000000) {
        return number;
      }
    } catch (e) {
      continue;
    }
  }
}

int? getIndexBUscaBinaria(List<int> list, int value) {
  final stopwatch = Stopwatch();
  stopwatch.start();
  int lower = 0;
  int higher = list.length - 1;
  while (lower <= higher) {
    int meio = ((lower + higher) / 2).toInt();
    
    int palpite = list[meio];

    if (palpite == value) {
      print("Tempo Busca Binaria: ${stopwatch.elapsed.inSeconds}");
      return meio;
    }

    if(palpite > value) {
      higher = meio -1;
    } else {
      lower = meio + 1;
    }
  }
  print("Tempo Busca Binaria: ${stopwatch.elapsed.inSeconds}");
  return null;
}

int? getIndexBuscaSimples(List<int> list, int value) {
  final stopwatch = Stopwatch();
  stopwatch.start();
  for (int c = 0; c < list.length; c++)  {
    if (list[c] == value) {
      print("Tempo Busca Simples: ${stopwatch.elapsed.inSeconds}");
      return c;
    }
  }
  print("Tempo Busca Simples: ${stopwatch.elapsed.inSeconds}");
  return null;
}