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


class ProfileCreatePage extends StatefulWidget {
  ProfileCreatePage({key});

  @override
  State<ProfileCreatePage> createState() => _ProfileCreatePageState();
}

class _ProfileCreatePageState extends State<ProfileCreatePage> {
  AuthenticationController authController =
  Get.put(AuthenticationController());

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.themeColor,
        title: const Text("Profile Create",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
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
                      height: 100,width: 100,

                    ),
                  ),
                  const SizedBox(height: 25),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomInput().regularInput(
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      controller: userNameController,
                      prefix: const Icon(Icons.person,color: Colors.grey,),
                      readOnly: false,
                      lable: "Full Name",),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomInput().regularInput(
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      prefix: const Icon(Icons.email,color: Colors.grey),
                      readOnly: false,
                      lable: "Email Address",),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomInput().regularInput(
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      keyboardType: TextInputType.phone,
                      controller: phoneNumberController,
                      prefix: const Icon(Icons.phone_android,color: Colors.grey),
                      readOnly: false,
                      lable: "Phone No.",),
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
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child:
                    Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                        ),
                        Checkbox(
                          value: this.value,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ), ///SizedBox
                        const Text(
                          'Employee can change the password ?',
                          style: TextStyle(fontSize: 17.0,color: Colors.blueAccent),
                        ),

                      ], //<Widget>[]
                    ),
                  ),

                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:CustomButtons().btnWithIcon(title: "Submit",
                          backgroundColor: ColorConstant.themeColor,
                          onTap:(){

                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );

                            // authController.login(userNameController.text,passwordController.text,context);
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
