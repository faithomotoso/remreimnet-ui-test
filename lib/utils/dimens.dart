import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Dimens {
  double _height;
  double _width;

  double get height => _height;

  double get width => _width;

  Dimens(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }
}
