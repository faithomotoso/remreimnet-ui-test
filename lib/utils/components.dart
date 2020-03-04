// class for reusable components

import 'package:flutter/material.dart';
import 'package:reimnet_flutter/model/UserModel.dart';
import 'package:reimnet_flutter/utils/helpers.dart';

Widget cardWidget(
    {Widget child, double width, double height, Color bgColor = Colors.white}) {
  return Container(
    padding: EdgeInsets.only(top: 22, bottom: 22, left: 20, right: 20),
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.6), blurRadius: 12)
        ]),
//    width: width,
//    height: height,
    child: child,
  );
}

Widget transactionCard({Transaction transaction, double height}) {
  return cardWidget(
//      height: height,
      bgColor: transaction.amount.contains("+") ? greenColor : Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("${transaction.photoLoc}"),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                transaction.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                transaction.amount,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                transaction.detail,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14
                ),
              )
            ],
          )
        ],
      ));
}
