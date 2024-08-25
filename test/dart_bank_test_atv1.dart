import 'package:dart_bank/models/premium_account.dart';
import 'package:dart_bank/models/simple_account.dart';
import 'package:dart_bank/services/transfer_service.dart';
import 'package:test/test.dart';
import 'package:dart_bank/models/account.dart';

void main() {
  group('transferService', () {
    late SimpleAccount account1;
    late SimpleAccount account2;
    late PremiumAccount premiumAccount;

    setUp(() {
      account1 = SimpleAccount('Arthur', 1001, 500.0);
      account2 = SimpleAccount('Arthur', 1002, 500.0);
      premiumAccount = PremiumAccount('Arthur', 1003, 500.0, cashBack: 10.0);
    });

    test('Não transferir da mesma conta', () {
      expect(() => transferService(account1, account1, 50.0), throwsArgumentError);
    });

    test('Não transferir com saldo zero ou negativo', () {
      expect(() => transferService(account1, premiumAccount, 0.0), throwsArgumentError);
      expect(() => transferService(account1, premiumAccount, -50.0), throwsArgumentError);
    });

    test('Não transferir valor maior que o saldo', () {
      expect(() => transferService(account1, premiumAccount, 600.0), throwsArgumentError);
    });
  });
}
