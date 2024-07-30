import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techwens_pms/ui/change_password.dart';
import '../../helper/ImageConstant.dart';
import '../../helper/style_const.dart';
import '../controller/authentication_controller.dart';
import '../helper/colorConstant.dart';
import '../widgets/custom_buttons.dart';
import '../widgets/custom_color.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_input.dart';
import 'home_page.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({key});
  AuthenticationController authController =
  Get.put(AuthenticationController());
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
             color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  const SizedBox(height: 150),
                  Center(
                    child: CustomImageView(
                      imagePath: ImageConstant.splashImage,
                      height: 200,width: 200,

                    ),
                  ),
                  const SizedBox(height: 75),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomInput().regularInput(
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      controller: userNameController,
                      prefix: Icon(Icons.person,color: Colors.grey,),
                      readOnly: false,
                      lable: "Phone/Email",),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomInput().regularInput(
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      prefix: const Icon(Icons.password,color: Colors.grey),
                      readOnly: false,
                      lable: "Password",),
                  ),


                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:CustomButtons().btnWithIcon(title: "Login",
                          backgroundColor: ColorConstant.themeColor,
                          onTap:(){
                            authController.login(userNameController.text,passwordController.text,context);
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),)

                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

}