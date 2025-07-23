import 'dart:async';
import 'dart:io';

void main(){

  print('Escolha uma atividade:');
  //mostrar atividades

  double? numberInuput = double.tryParse(stdin.readLineSync() ?? '0');

}

void calculator(){
bool isTrue = true;

while(isTrue){

  print('Calculadora informe 2 números: ');

  print('Informe o primeiro número! ');
  double numberInput1 = readNumberAndConvert();

/*
  int numberInuput = int.parse(stdin.readLineSync() ?? '0');
*/

  


  print('Informe o segundo número! ');
  double numberInput2 = readNumberAndConvert();
  
  print('Escolha um operador: | + | - | * | / |');
  String operatorInput = readOperator();

  double result = caculatorResult(numberInput1, numberInput2, operatorInput);

  print('O resultado de ${numberInput1} ${operatorInput} ${numberInput2} é ${result}');

}


}


double readNumberAndConvert(){
    stdout.write('Digite o valor: ');
    String? number = stdin.readLineSync();
    double numberOut = double.parse(number!);
    return numberOut;
}

String readOperator(){
  String? operator;
  try{
  
  stdout.write('Digite o operador: ');
  operator = stdin.readLineSync();
  }
  catch(operator){
    if(operator == null)
       return 'O valor não pode ser nulo';
  }


String operatorOut = operator.toString();
return operatorOut;

}


double caculatorResult(double number1, double number2, String operatorInput){

double result = 0; 

  switch(operatorInput){
    case '+':
    result = number1 + number2; 
    break;
    case '-':
    result = number1 = number2;
    break;
    case '*':
    result = number1 * number2;
    break;
    case '/':
    result = number1 / number2;
    break;
  }

return result;
}

