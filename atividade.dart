import 'dart:async';
import 'dart:io';
import 'dart:vmservice_io';


  //mostrar atividades
void main(){

  print('Escolha uma atividade:');
  int? option = int.parse(stdin.readLineSync() ?? '0');

  switch(option){
    case 1:
    print('Atividade 1: Calculadora: ');
    calculator();
    break;
    default:
      print('Escolha um ´numero válido de 1 a ....');

  }




}

void calculator(){

bool isTrue = true;

while(isTrue){

  print('Calculadora informe 2 números: ');

  print('Informe o primeiro número! ');
  double numberOut1 = readNumberInput();

  print('Informe o segundo número! ');
 double numberOut2 = readNumberInput();
  

  print('Escolha um operador: | + | - | * | / |');
  String operatorInput = readOperator();

  double resultCalculator = caculatorResult(numberOut1, numberOut2, operatorInput);
  print('O resultado de $numberOut1 | $operatorInput | $numberOut2 = $resultCalculator');
}

}

 double readNumberInput(){
  double? numberInput = double.tryParse(stdin.readLineSync() ?? '0');
  if(numberInput != null || numberInput == 0){// arrumar para ser == 0 
    return numberInput = 0;
  }
   return throw new Exception('O número não pode ser nulo!!');
 }


//Arrumar leitor de opearador, add ??
String readOperator(){
 
  stdout.write('Digite o operador: ');
  String? operator = stdin.readLineSync();
  if(operator == null){
    throw new Exception('O operador não pode ser nulo!!');
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
    result = number1 - number2;
    break;
    case '*':
    result = number1 * number2;
    break;
    case '/':
    result = number1 / number2;
    if(number2 == 0)
      print('O divisor não pode ser zero!!');
      calculator();
    default:
    throw new Exception('Informe um operador válido!!');
    
  }

return result;
}

