import 'package:dart_bank/models/account.dart';

void transferService(Account origin, Account destination, double value) {
  if(origin == destination){
     print('Erro: Não é possivel transferir da mesma conta');
    throw ArgumentError('Não foi possivel a transferencia');
  }
  if(value <= 0 ) {
     print('Erro: Não é possivel transferir, saldo insuficiente');
  throw ArgumentError('Saldo Insuficiente');
  }
  if(value > origin.getBalance()){
    print('Erro: Não é possivel transferir valor maior que o saldo atual');
    throw ArgumentError('Erro: Valor de transferencia maior que o saldo');
  }
  origin.removeBalance(value);
  destination.addBalance(value);
}
