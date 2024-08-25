import 'package:dart_bank/models/account.dart';

void transferService(Account origin, Account destination, double value) {
  if(origin == destination){
    throw ArgumentError('Não foi possivel a transferencia');
  }
  if(value <= 0 ) {
  throw ArgumentError('Saldo Insuficiente');
  }
  if(value > origin.getBalance()){
    throw ArgumentError('Erro: Valor de transferencia maior que o saldo');
  }
  origin.removeBalance(value);
  destination.addBalance(value);
}
