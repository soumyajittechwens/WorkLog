import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';



import '../Utils/Shared Preference/shared_pref.dart';
import '../helper/ImageConstant.dart';
import '../helper/colorConstant.dart';
import '../widgets/custom_buttons.dart';
import '../widgets/custom_color.dart';
import '../widgets/custom_image_view.dart';
import 'home_page.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if( SharedPrefUtils.getToken()!=null&&SharedPrefUtils.getToken().toString().isNotEmpty)
        {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()),
          );
        }
      else
        {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen()),
          );
        }


    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          decoration:  BoxDecoration(
            color: Colors.white,
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Align(
                  alignment: Alignment.center,
                  child: CustomImageView(
                    height: 250,
                    width: 250,
                    imagePath: ImageConstant.splashImage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  dispose() {
    super.dispose();
  }
}
