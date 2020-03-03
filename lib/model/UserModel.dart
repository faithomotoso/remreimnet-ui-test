import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class User extends Model{
  static User of(BuildContext context) => ScopedModel.of<User>(context);

  String _maskedAccountNumber = "**** 6288";
  double _availableBalance = 12500;
  double _monthlyLimit = 45000;
  double _usedLimit = 20000;
  List<Currency> _currencies = [Currency(name: "USD", symbol: "\$"), Currency(name: "EUR", symbol: "\u8364")];
  Currency _selectedCurrency = Currency(name: "USD", symbol: "\$");

  String get maskedAccountNumber => _maskedAccountNumber;
  double get availableBalance => _availableBalance;
  double get monthlyLimit => _monthlyLimit;
  double get usedLimit => _usedLimit;
  Currency get currency => _selectedCurrency;

  double calculateUsedLimitPercentage(){
    return _usedLimit / _monthlyLimit * 100;
  }
}

class Currency{
  String name;
  String symbol;

  Currency({this.name, this.symbol});
}

class Transaction {
  String name;
  String amount;
  String photoLoc;
  String detail;

  Transaction({
    this.name, this.amount, this.photoLoc, this.detail
});
}