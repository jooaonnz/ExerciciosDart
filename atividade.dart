import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:vmservice_io';

//mostrar atividades
void main() {
  print('Atividades em dart '); //listar atividades
  print('Escolha uma atividade:');
  int? option = int.parse(stdin.readLineSync() ?? '0');

  switch (option) {
    case 1:
      print('Atividade 1: Calculadora ');
      calculator();
      break;

    case 2:
      print('Atividad 2: Verificar idade maior que 18 anos');
      yearVerificator();
      break;

    case 3:
      print('Atividade 3: Contagem regressiva');
      countToZero();
      break;

    case 4:
      print('Atividade 4: Calculadora de Média e Situação do Aluno');
      calculatorAvarege();
      break;

    case 5:
      print('Atividade 5: Contador de Vogais e Consoantes');
      learnVogal();
      break;

    default:
      print('Escolha um ´numero válido de 1 a ....');
  }
}

void calculator() {
  bool isTrue = true;

  while (isTrue) {
    print('Calculadora informe 2 números: ');

    print('Informe o primeiro número! ');
    double numberOut1 = readNumberInput();

    print('Informe o segundo número! ');
    double numberOut2 = readNumberInput();

    print('Escolha um operador: | + | - | * | / |');
    String operatorInput = readOperator();

    double resultCalculator = caculatorResult(
      numberOut1,
      numberOut2,
      operatorInput,
    );
    print(
      'O resultado de $numberOut1 | $operatorInput | $numberOut2 = $resultCalculator',
    );
  }
}

double readNumberInput() {
  double? numberInput = double.tryParse(stdin.readLineSync() ?? '0');
  if (numberInput != null || numberInput == 0) {
    // arrumar para ser == 0 cls
    return numberInput = 0;
  }
  return throw new Exception('O número não pode ser nulo!!');
}

//Arrumar leitor de opearador, add ??
String readOperator() {
  stdout.write('Digite o operador: ');
  String? operator = stdin.readLineSync();
  if (operator == null) {
    throw new Exception('O operador não pode ser nulo!!');
  }

  String operatorOut = operator.toString();
  return operatorOut;
}

double caculatorResult(double number1, double number2, String operatorInput) {
  double result = 0;

  switch (operatorInput) {
    case '+':
      result = number1 + number2;
      break;
    case '-':
      result = number1 - number2;
      break;
    case '*':
      result = number1 * number2;
      break;
    case '/':
      result = number1 / number2;
      if (number2 == 0) print('O divisor não pode ser zero!!');
      calculator();
    default:
      throw new Exception('Informe um operador válido!!');
  }

  return result;
}

void yearVerificator() {
  try {
    bool isTrue = true;

    print('Para acessar o bar precisamos saber sua idade!');

    while (isTrue) {
      stdout.write('Informe sua idade: ');
      int? yearInput = int.parse(stdin.readLineSync() ?? '0');

      if (yearInput! < 18) {
        print('Acesso negado');
        isTrue = true;
      } else {
        print('Acesso liberado');
        isTrue = false;
      }
    }
  } on FormatException {
    print('Insira um valor válido!');
  } catch (e) {
    print('Erro inesperado reinicie o sistema!');
  } finally {
    yearVerificator();
  }
}

// para sair digite um número negativo
void countToZero() async {
  try {
    bool isTrue = true;

    while (isTrue) {
      print('Para sair informe 0 ou número negativo');
      stdout.write('Informe um número: ');
      int? number = int.parse(stdin.readLineSync() ?? '0');

      if (number < 1) {
        print('Saindo..');
        main();
      }

      for (int i = number; i >= 0; i--) {
        print('Faltam |$i| segundos');
        await Future.delayed(Duration(seconds: 1));
      }
    }
  } on FormatException {
    print('Insira um valor válido');
    countToZero();
  } catch (e) {
    print('Erro inesperado, reinicie o sistema!!');
  }
}

void calculatorAvarege() {
  //tratamento de erros

  print('Informe as notas');

  print('Matemática');
  double gradeMath = double.parse(stdin.readLineSync()!);

  print('Português');
  double gradePortuguese = double.parse(stdin.readLineSync()!);

  print('Física');
  double gradePyshic = double.parse(stdin.readLineSync()!);

  double result = (gradeMath + gradePortuguese + gradePyshic) / 3;

  switch (result) {
    case > 7:
      print('Aprovado');
      break;

    case > 5 && < 6.9:
      print('Recuperação');
      break;

    case < 5:
      print('Reprovado');
      break;
  }
}

void learnVogal() {
  stdout.write('Escreva uma frase: ');
  String word = stdin.readLineSync()!;
  int Contador = 0;

  for (int i = 0; i < word.length; i++) {
    if (word[i] == 'a') Contador++;
  }
  print(Contador);
}
