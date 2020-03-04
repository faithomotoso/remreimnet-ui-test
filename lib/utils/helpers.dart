import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


final Color greenColor = Color(0xff29876e);
final Color lightPurple = Color(0xfff7f1fd);
final Color yellowColor = Color(0xfffcc100);
final Color offWhite = Color(0xfffefefe);

displayAmount(double amount, {String symbol = ""}){
  return NumberFormat.currency(symbol: symbol, decimalDigits: 0).format(amount);
}