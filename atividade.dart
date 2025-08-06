import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:vmservice_io';

void main() {

try {

  print('Atividades em dart ');
  print('Atividade 1 | Calculadora ');
  print('Atividade 2 | Verificar idade maior que 18 anos');
  print('Atividade 3 | Contagem regressiva');
  print('Atividade 4 | Calculadora de Média e Situação do Aluno');
  print('Atividade 5 | Contador de Vogais e Consoantes');
  print('Atividade 6 | Jogo de Adivinhação');

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

    case 6:
      print('Atividade 6: Jogo de Adivinhação');
      randomNumber();
      break;

    default:
      print('Escolha um ´numero válido de 1 a 6');
      main();
    }
  }
  on FormatException{
    print('ERRO: Insira um valor válido');
    main();
    }
  catch(e){
    Exception('Erro inesperado, reinicie o sistema!');
    main();
  }

}
// calculadora com bug
// 
void calculator() {
  
  try{

  bool isTrue = true;

  while (isTrue) {
    print('Calculadora informe 2 números: ');

    print('Informe o primeiro número! ');
    double numberOut1 = double.parse(stdin.readLineSync()!);
    print('Informe o segundo número! ');
    double numberOut2 = double.parse(stdin.readLineSync()!);

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
    
    main();

  }
  }
  on FormatException{
    print('Insira um valor válido!!');
    calculator();
  }
  catch (ex){
    print('Erro inesperado, reinicie o sistema!!');
  }
  
}

String readOperator() {
  stdout.write('Digite o operador: ');
  String? operator = stdin.readLineSync();
  if (operator == null) {
    throw new Exception('O operador não pode ser nulo!!');
  }

  String operatorOut = operator.toString();
  return operatorOut;

}
//add try catch
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

    main();

  } on FormatException {
    print('Insira um valor válido!');
    yearVerificator();
  } catch (e) {
    print('Erro inesperado reinicie o sistema!');
  }

}

// para sair digite um número negativo ajeitar
void countToZero() async {
  
  try {

    bool isTrue = true;
    while (isTrue) {
      print('Para sair informe 0 ou número negativo');
      stdout.write('Informe um número: ');
      int? number = int.parse(stdin.readLineSync() ?? '0');

        for (int i = number; i >= 0; i--) {
        print('Faltam |$i| segundos');
        await Future.delayed(Duration(seconds: 1));
         if (number < 1) {
          print('Saindo..');
          main();
        break;
          }
        }
    }

  } 
  on FormatException {
    print('Insira um valor válido');
    countToZero();
  } catch (e) {
    print('Erro inesperado, reinicie o sistema!!');
  }

}

void calculatorAvarege() {
 
 try{

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

  main();

 }
 on FormatException{
  print('Insira um valor válido!!');
  calculatorAvarege();
 }
 catch (e){
  Exception('Erro inesperado, reinicie o sistema!!');
 }
 
}

void learnVogal() {
  // nao ta separando numeros
  try{

  stdout.write('Escreva uma frase: ');
  String wordInput = stdin.readLineSync()!;
  if(wordInput.trim().isEmpty){
    throw Exception('O valo não pode ser nulo!');
  }
  
  String word = wordInput.replaceAll(RegExp(r'[^a-zA-Z0-9À-ÿ]'), '').toLowerCase();

  int vogais = 0;
  int consoantes = 0;

  for (var char in word.split('')) {
    if (RegExp(r'[aeiouáéíóúàèìòùâêîôûãõ]').hasMatch(char)) {
      vogais++;
    } else {
      consoantes++;
    }
  }

  print('Total de vogais na palavra $vogais');
  print('Total de consoantes na palavra $consoantes');

  print('Enter pra voltar para o início!');
  String backHome = stdin.readLineSync()!;

  main();

  }
  on Exception{
    print('O valor não pode ser nulo');
    learnVogal();
  }
  catch(e){
    print('Erro inesperado, renicie o sistema!!');
  }

}
// tratamento de erros
//para sair digite uma tecla
void randomNumber(){
  
  try{
  Random random = Random();

  print('Acerte um número de 1 a 100');
  bool isTrue = true;
  int generateNumber = random.nextInt(101);
  int attempts = 0;

  while(isTrue){ 
    int number = int.parse(stdin.readLineSync()!);
      if(number > generateNumber)
        print('O valor está abaixo!');
      else if(number < generateNumber)
        print('O valor está acima!');
      else
        isTrue = false;
      attempts++;
  }

  print('Parabéns você acertou!');
  print('Número de tentativas $attempts ');
  }
  on FormatException{
    print('Insira um valor válido!!');
    randomNumber();
  }
  catch(e){
    print('Erro inesperado, reinicie o sistema!!');
  }

}