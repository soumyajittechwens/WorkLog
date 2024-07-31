import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techwens_pms/model/ProjectIdWiseWorklogsData.dart';
import 'package:techwens_pms/ui/change_password.dart';
import 'package:techwens_pms/ui/login_page.dart';
import '../Utils/Shared Preference/shared_pref.dart';
import '../model/project_list_data.dart';
import '../services/authentication_services.dart';
import '../ui/home_page.dart';

class AuthenticationController extends GetxController {
  ProjectListData? projectListData;
  ProjectIdWiseWorkLogsData? projectIdWiseWorkLogsData;
  void login(String userName, String password, BuildContext context) async {
    if (userName.isEmpty) {
      Get.snackbar(
        'Validation Errors',
        'Account: This field may not be blank.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (password.isEmpty) {
      Get.snackbar(
        'Validation Errors',
        'Password: This field may not be blank.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    var data = await AuthenticationServices.login(userName, password);

    if (data == null) {
      Get.snackbar(
        'Error',
        'No response from server',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (data != null) {
      if (data['status'] != null && data['status']) {
        storeUserData(data);

        bool isFirstTimeUser = data['response']['isFirstTimeUser'];

        if (isFirstTimeUser) {
          Get.snackbar(
            'Success',
            'Please change your password',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePassword()),
          );
        }
        else {
          Get.snackbar(
            'Success',
            data['message'],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      }
      else {
        Get.snackbar(
          'Failure',
          data['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  void changePassword(String newPassword, String confirmPassword, BuildContext context) async {
    if (newPassword.isEmpty) {
      Get.snackbar(
        'Validation Errors',
        'Password: This field may not be blank.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    } else if (confirmPassword.isEmpty) {
      Get.snackbar(
        'Validation Errors',
        'Confirm Password: This field may not be blank.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    var data = await AuthenticationServices.changePassword(
        newPassword, confirmPassword);

    if (data == null) {
      Get.snackbar(
        'Error',
        'No response from server',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (data != null) {
      if (data['status'] != null && data['status']) {
        Get.snackbar(
          'Success',
          data['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        Get.snackbar(
          'Failure',
          data['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
  void saveWorkLog(String projectId, String remarks, BuildContext context, Function(String, Color) showSnackbar) async {
    if (projectId.isEmpty) {
      Get.snackbar(
        'Validation Errors',
        'ProjectId: This field may not be blank.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    var data = await AuthenticationServices.saveWorkLog(
        projectId, remarks);

    if (data == null) {
      Get.snackbar(
        'Error',
        'No response from server',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (data != null) {
      if (data['status'] != null && data['status']) {
        showSnackbar(data['message'], Colors.green);

      } else {
        showSnackbar(data['message'], Colors.red);
      }
    }
  }

  void storeUserData(Map<String, dynamic> data) async {
    String token = data['token'];
    String fullName = data['response']['fullName'];
    String email = data['response']['email'];
    String phone = data['response']['phone'];
    String role = data['response']['role'];

    print("role===$role");
    print("token===$token");

    await SharedPrefUtils.setToken(token);
    await SharedPrefUtils.setName(fullName);
    await SharedPrefUtils.setEmail(email);
    await SharedPrefUtils.setPhone(phone);
    await SharedPrefUtils.setRole(role);

    print("tokenGet===${SharedPrefUtils.getToken()}");
  }

  getProjectList() async {
    var data = await AuthenticationServices().getProjectList();
    if (data['status'] ) {
      if (kDebugMode) {
        print("projectListData===$data");
      }
      projectListData = ProjectListData.fromJson(data);
      update();
    }
  }
  getProjectIdWiseWorkLogDataList(String projectId,Function() showButtonData) async {
    var data = await AuthenticationServices().getProjectIdWiseWorkLogList(projectId);
    if (data['status'] ) {
      if (kDebugMode) {
        print("projectListData===$data");
      }
      projectIdWiseWorkLogsData = ProjectIdWiseWorkLogsData.fromJson(data);
      showButtonData();
      update();
    }
  }

}
