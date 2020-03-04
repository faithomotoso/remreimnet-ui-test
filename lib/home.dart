import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:reimnet_flutter/model/UserModel.dart';
import 'package:reimnet_flutter/screens/transaction_screen.dart';
import 'package:reimnet_flutter/utils/components.dart';
import 'package:reimnet_flutter/utils/dimens.dart';
import 'package:reimnet_flutter/utils/helpers.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  User userModel;
  Dimens dimens;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    userModel = User.of(this.context);
  }

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Scaffold(
      backgroundColor: offWhite,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (i) {
            setState(() {
              selectedIndex = i;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: SizedBox()),
            BottomNavigationBarItem(
                icon: Transform.rotate(
                  angle: -70,
                  child: Icon(
                    Icons.swap_horiz,
                  ),
                ),
                title: SizedBox()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.card_membership,
                ),
                title: SizedBox()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people_outline,
                ),
                title: SizedBox())
          ],
        ),
      ),
      body: Container(
//        margin: EdgeInsets.only(bottom: 50),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                child: Container(
                  height: dimens.height,
                  width: dimens.width,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: AspectRatio(
                      aspectRatio: 5 / 4,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/background_image.jpg"),
                                fit: BoxFit.cover)),
                        padding: EdgeInsets.only(
                            left: dimens.width * 0.05,
                            top: dimens.height * 0.067),
                        child: Text(
                          "Overview",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )),
            Positioned(
                top: dimens.height * 0.15,
                child: Container(
                    width: dimens.width,
                    height: dimens.height * 0.75,
                    alignment: Alignment.center,
                    child: Container(
                      width: dimens.width * 0.9,
//                      color: Colors.purpleAccent,
                      child: Column(
                        children: <Widget>[
                          cardWidget(
//                              width: dimens.width * 0.8,
                              child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Available Balance",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        displayAmount(
                                            userModel.availableBalance),
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 90,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Stack(
                                          children: <Widget>[
                                            Icon(
                                              Icons.notifications_none,
                                              size: 36,
                                              color: Colors.black,
                                            ),
                                            Positioned(
                                              top: 5,
                                              right: 8,
                                              child: Container(
                                                  height: 8,
                                                  width: 8,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: Align(
                                                    child: Container(
                                                      height: 5,
                                                      width: 5,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: yellowColor),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/avatar/avatar1.jpg"),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    userModel.maskedAccountNumber,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: 90,
                                    child: MaterialButton(
                                        elevation: 0,
                                        height: 1,
                                        onPressed: () {},
                                        color: greenColor,
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.only(
                                            top: 6,
                                            bottom: 6,
                                            left: 14,
                                            right: 14),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              userModel.currency.name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.white,
                                              size: 18,
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              )
                            ],
                          )),
                          cardWidget(
//                              width: dimens.width * 0.8,
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CircularPercentIndicator(
                                  radius: 60,
                                  percent:
                                      userModel.calculateUsedLimitPercentage() /
                                          100,
                                  progressColor: greenColor,
                                  center: RichText(
                                    text: TextSpan(
                                        text:
                                            "${userModel.calculateUsedLimitPercentage().round()}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: "%",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold))
                                        ]),
                                  )),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Monthly transfer limit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text:
                                            "${displayAmount(userModel.usedLimit, symbol: userModel.currency.symbol)} ",
                                        style: TextStyle(
                                            color: greenColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: "of ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          TextSpan(
                                              text:
                                                  "${displayAmount(userModel.monthlyLimit, symbol: userModel.currency.symbol)}")
                                        ]),
                                  )
                                ],
                              )
                            ],
                          )),
                          SizedBox(
                            height: 2,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => ScopedModel<User>(model: userModel, child: TransactionScreen(),)));
                            },
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Transactions",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.black,
                                    size: 28,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: <Widget>[
                                Container(
                                  width: dimens.width,
                                  alignment: Alignment.center,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: <Widget>[
                                        for (Transaction transaction
                                        in userModel.transactions)
                                          transactionCard(
                                            transaction: transaction,
                                          )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )))
          ],
        ),
      ),

//      body: body(),
    );
  }

}
