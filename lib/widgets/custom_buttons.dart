import 'package:flutter/material.dart';

import '../helper/colorConstant.dart';

class CustomButtons {
  Widget btnMain({required String title, required Function onTap}) {
    return SizedBox(
      height: 45,
      width: 145,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstant.widgetColor, // Button color
          // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
  Widget btnWithIcon({required String title, required Function onTap,Widget? icon, required Color backgroundColor}) {
    return SizedBox(
      height: 50,
      width: 160,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Button color
          // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25)
        ),
        child:
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 10),
            icon!
          ],
        ),
      ),
    );
  }
}
