import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class User extends Model {
  static User of(BuildContext context) => ScopedModel.of<User>(context);

  String _maskedAccountNumber = "**** 6288";
  double _availableBalance = 12500;
  double _monthlyLimit = 45000;
  double _usedLimit = 20000;
  DateTime deliveryDate = DateTime.parse("2019-10-29");
  List<Currency> _currencies = [
    Currency(name: "USD", symbol: "\$"),
    Currency(name: "EUR", symbol: "\u8364")
  ];
  Currency _selectedCurrency = Currency(name: "USD", symbol: "\$");
  List<Conversion> conversionRates = [
    Conversion(name: "USD", conv: 0.8869, convName: "EUR"),
    Conversion(name: "EUR", conv: 1.1275, convName: "USD")
  ];
  List<Transaction> _transactions = [
    Transaction(
        name: "Victa Willie",
        amount: "+\$597",
        photoLoc: "assets/avatar/avatar2.jpg",
        detail: "Received 2h ago"),
    Transaction(
        name: "Vladimir",
        amount: "-\$146",
        photoLoc: "assets/avatar/avatar3.png",
        detail: "Received 4h ago")
  ];

  String get maskedAccountNumber => _maskedAccountNumber;

  double get availableBalance => _availableBalance;

  double get monthlyLimit => _monthlyLimit;

  double get usedLimit => _usedLimit;

  Currency get currency => _selectedCurrency;

  List<Currency> get currencies => _currencies;

  List<Transaction> get transactions => _transactions;

  double calculateUsedLimitPercentage() {
    return _usedLimit / _monthlyLimit * 100;
  }
}

class Currency {
  String name;
  String symbol;

  Currency({this.name, this.symbol});
}

class Transaction {
  String name;
  String amount;
  String photoLoc;
  String detail;

  Transaction({this.name, this.amount, this.photoLoc, this.detail});
}

class Conversion {
  String name;
  double one = 1;
  double conv;
  String convName;

  Conversion({this.name, this.conv, this.convName});

  @override
  String toString() {
    return "$one $name = $conv $convName";
  }
}
