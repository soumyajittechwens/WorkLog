// import 'dart:ui';

import 'package:flutter/material.dart';

import 'colorConstant.dart';

class StyleConst{
  static TextStyle header1 = TextStyle (
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: ColorConstant.black1);
  static TextStyle header2 = TextStyle (
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static TextStyle stl400_16 = TextStyle (
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorConstant.black1,
  );
  static TextStyle stl400_16_grey = TextStyle (
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorConstant.grey1,
  );
  static TextStyle stl400_16_primary = TextStyle (
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorConstant.themeColor,
  );
  static TextStyle stl400_15 = TextStyle (
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorConstant.black,
  );
  static TextStyle stl700_24 = TextStyle (
      fontSize: 24, fontWeight: FontWeight.w700,color: ColorConstant.black1
  );
}