import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:reimnet_flutter/model/UserModel.dart';
import 'package:reimnet_flutter/utils/components.dart';
import 'package:reimnet_flutter/utils/dimens.dart';
import 'package:reimnet_flutter/utils/helpers.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class TransactionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionScreenState();
  }
}

class _TransactionScreenState extends State<TransactionScreen> {
  Dimens dimens;
  User userModel;
  TextEditingController usdController = TextEditingController();
  TextEditingController eurController = TextEditingController();
  int conversionOrder = 0; // 0 => usd to eur, 1 => eur to usd
  bool keyboardActive = false;
  Conversion usdToEurConversion;
  Conversion eurToUsdConversion;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    usdController.text = "1000";
    eurController.text = "886.69";
    userModel = User.of(this.context);

    usdToEurConversion = userModel.conversionRates[0];
    eurToUsdConversion = userModel.conversionRates[1];

    KeyboardVisibilityNotification().addNewListener(
      onShow: (){
        setState(() {
          keyboardActive = true;
        });
      },
      onHide: (){
        setState(() {
          keyboardActive = false;
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: dimens.height * 0.01,
              child: Container(
                height: dimens.height * 0.06,
                width: dimens.width,
                child: Align(
                  child: Container(
                    width: dimens.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        customButton(
                            icon: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: (){
                              Navigator.pop(context);
                        }),
                        Text(
                          "Transaction",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        customButton(
                            icon: Icon(
                          Icons.more_horiz,
                          color: Colors.black,
                          size: 30,
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: dimens.height * 0.1,
              child: Container(
                height: dimens.height * 0.85,
                width: dimens.width,
                child: Align(
                  child: Container(
                    width: dimens.width * 0.9,
                    child: ListView(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Enter Amount",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            Text(
                              "%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      customCard(
                        height: dimens.height * 0.3,
                        bgColor: greenColor,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              conversionOrder == 0 ? usdConvRow() : eurConvRow(),
                              Expanded(
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: 1,
                                          color: Colors.white.withOpacity(0.4),
                                        ),
                                      ),
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            if (conversionOrder == 0){
                                              setState(() {
                                                conversionOrder = 1;
                                              });
                                            } else {
                                              setState(() {
                                                conversionOrder = 0;
                                              });
                                            }
                                          },
                                          child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
//                                          child: Icon(
//                                            Icons.refresh,
//                                            color: Colors.black,
//                                            size: 30,
//                                          ),
                                              child: Align(
                                                  child: Image.asset("assets/rotate_icon.png",
                                                    color: Colors.black, height: 30 , width: 30,)
                                              )
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              conversionOrder == 0 ? eurConvRow() : usdConvRow()
                            ],
                          ),
                        )
                      ),
                        SizedBox(
                          height: 14,
                        ),
                        conversionRowView(conversion: usdToEurConversion),
                        SizedBox(
                          height: 10,
                        ),
                        conversionRowView(conversion: eurToUsdConversion),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "When to deliver",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 32,),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        customCard(
                          bgColor: lightPurple,
                          height: dimens.height * 0.18,
                        child: Align(
                          child: Container(
                            height: dimens.height * 0.07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                customButton(
                                    color: yellowColor,
                                    icon: Icon(Icons.history, color: Colors.black, size: 30,)
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Money will be delivered",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),

                                    ),
                                    Text(
                                        DateFormat("dd.MM.yyy").format(userModel.deliveryDate),
                                        style: TextStyle(
                                            color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold
                                        )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: !keyboardActive ?  GestureDetector(
                onTap: (){
                  print("USD to EUR: ${usdToEurConversion.convert(amount: 1000)}");
                  print("eur to usd: ${eurToUsdConversion.convert(amount: 1000)}");
                },
                child: Container(
                  width: dimens.width,
                  child: Align(
                    child: Container(
                      width: dimens.width * 0.9,
                      padding: EdgeInsets.only(top: 14, bottom: 14),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(24)),
                      child: Center(
                        child: Text(
                          "Send",
                          style: TextStyle(color: Colors.white, fontSize: 16,),
                        ),
                      ),
                    ),
                  ),
                ),
              ) : SizedBox(),
            )
          ],
        ),
      ),
    );
  }

  Widget conversionRowView({Conversion conversion}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Course ${conversion.name}:",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,),
        ),
        Text(
          conversion.toString(),
          style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500
          ),),
      ],
    );
  }

  Widget usdConvRow(){
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: dimens.width * 0.5,
          child: TextField(
            controller: usdController,
            onChanged: (v){
              setState(() {
                eurController.text = usdToEurConversion.convert(amount: double.parse(v));
              });
            },
            keyboardType:
            TextInputType.numberWithOptions(),
            style: TextStyle(
                color: Colors.white, fontSize: 30,
              fontFamily: "Consolas",),
            decoration: InputDecoration.collapsed(
                hintText: "Amount"),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
//                                      width: 40,
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  userModel.currency.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 18,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget eurConvRow(){
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: dimens.width * 0.5,
          child: TextField(
            controller: eurController,
            onChanged: (v){
              setState(() {
                usdController.text = eurToUsdConversion.convert(amount: double.parse(v));
              });
            },
            keyboardType:
            TextInputType.numberWithOptions(),
            style: TextStyle(
                color: Colors.white, fontSize: 30,
              fontFamily: "Consolas",),
            decoration: InputDecoration.collapsed(
                hintText: "Amount"),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
//                                      width: 40,
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  userModel.currencies[1].name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14),
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 18,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget customCard({Widget child, double height, Color bgColor}){
    return Container(
      height: height,
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: bgColor
      ),
      child: child
    );
  }
}
