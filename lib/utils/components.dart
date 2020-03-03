// class for reusable components

import 'package:flutter/material.dart';

Widget cardWidget({Widget child, double width, double elevation = 6}){
//  return Card(
//    color: Colors.white,
//    elevation: elevation,
//    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//    child: Container(
//      padding: EdgeInsets.only(top: 22, bottom: 22, left: 20, right: 20),
//      margin: EdgeInsets.all(8),
//      width: width,
//      child: child,
//    ),
//  );
  return Container(
    padding: EdgeInsets.only(top: 22, bottom: 22, left: 20, right: 20),
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.6), blurRadius: 12)
      ]
    ),
    width: width,
    child: child,
  );
}