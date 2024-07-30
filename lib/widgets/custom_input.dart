import 'package:flutter/material.dart';

import '../helper/colorConstant.dart';

class CustomInput {
  Widget regularInput({String lable = "",Widget? prefix,Widget? suffix,TextEditingController? controller,bool readOnly=false,  TextInputType? keyboardType,  bool? obscureText, required TextInputAction textInputAction}) {

    return TextFormField(
      obscureText:obscureText! ,
      controller: controller,
      readOnly: readOnly,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius:
        BorderRadius.circular(8),borderSide: BorderSide(color: Colors.grey)),
        enabledBorder:OutlineInputBorder(borderRadius:
        BorderRadius.circular(8),borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(borderRadius:
        BorderRadius.circular(8),borderSide: BorderSide(color: Colors.grey)),
        fillColor: Colors.white,
        filled: true,
          prefixIcon: prefix,
          suffixIcon: suffix,
        labelText: lable,
        contentPadding: EdgeInsets.all(15),
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ColorConstant.grey1
        )
      ),
    );
  }
}
