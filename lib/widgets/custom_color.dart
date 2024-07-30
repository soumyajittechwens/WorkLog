import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/colorConstant.dart';

 LinearGradient kBackgroundGradient = LinearGradient(
  colors: [
    const Color(0xFF7678ED),
    ColorConstant.themeColor.withOpacity(0.68), // Replace with your start color
    const Color(0xFF7678ED), // Replace with your end color
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

 LinearGradient kAllBackgroundGradient = const LinearGradient(
   begin: Alignment.topLeft,
   end: Alignment.bottomRight,
  colors: [
    ColorConstant.themeColor,
    Colors.white,
    Colors.white,
    Colors.white,
    ColorConstant.themeColor, // Replace with your end color
  ],
);