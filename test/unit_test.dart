import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:reimnet_flutter/model/UserModel.dart';

void main() {
  final User user = User();
  group("Tests the initial variables in the model class", (){
    test("Checks the available balance", (){
      expect(user.availableBalance, 12500);
    });

    test("Checks the monthly limit", (){
      expect(user.monthlyLimit, 45000);
    });

    test("Checks the used limit", (){
      expect(user.usedLimit, 20000);
    });

    test("Checks the number of currencies available", (){
      expect(user.currencies.length, 2);
    });

    test("Checks the number of transactions", (){
      expect(user.transactions.length, 2);
    });

    test("Checks the currency name", (){
      expect(user.currencies[0].name, "USD");
      expect(user.currencies[1].name, "EUR");
    });

    test("Tests usd to eur conversion", (){
      expect(user.conversionRates[0].convert(amount: 500), "443.45");
    });

    test("Tests eur to usd conversion", (){
      expect(user.conversionRates[1].convert(amount: 500), "563.75");
    });
  });
}