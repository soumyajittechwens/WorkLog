import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dioClient;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:techwens_pms/Utils/Shared%20Preference/shared_pref.dart';
import 'DioInterceptor.dart';
import 'appConfig.dart';
import 'base.dart';

class AuthenticationServices {
  late final Dio _dio;
  AuthenticationServices() {
    _dio = Dio(BaseOptions(baseUrl: AppConfig.getBaseUrl()));
    _dio.interceptors.add(DioInterceptor());
  }


  static login(String userName, String password) async {
    try {
      EasyLoading.show();
      dioClient.Response response;
      var mData = {
        "loginIdentifier": userName,
        "password": password,
      };
      response = await BaseUrl.getDio1().post(
        "api/auth/login",
        data: mData,
        options: Options(contentType: "application/json"),
      );
      EasyLoading.dismiss();

      if (response.statusCode == 200) {
        return response.data;
      }
      else {
        return null;
      }
    } on DioError catch (dioError) {
      EasyLoading.dismiss();
      if (dioError.response != null) {
        var data = dioError.response!.data;

        if (data['status'] == 400) {
          // Check if the response data contains 'errors'
          if (data['errors'] != null) {
            List<dynamic> errors = data['errors'];
            String accountErrorMessage = "";
            String passwordErrorMessage = "";
            try {
              passwordErrorMessage = errors[0]['password'][0];
            } catch (e) {}
            try {
              accountErrorMessage = errors[0]['account'][0];
            } catch (e) {}

            if (accountErrorMessage.isNotEmpty) {
              Get.snackbar(
                'Validation Errors',
                '$accountErrorMessage',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            } else if (passwordErrorMessage.isNotEmpty) {
              Get.snackbar(
                'Validation Errors',
                '$passwordErrorMessage',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          } else {
            Get.snackbar(
              'Error',
              'Unknown validation error occurred.',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        }
        return null;
      }
      else {
        // Dio error without response, such as network issues

        Get.snackbar(
          'Network Error',
          'Failed to connect to the server.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return null;
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Error',
        'An unexpected error occurred.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }
  static changePassword(String newPassword, String confirmPassword) async {
    try {
      EasyLoading.show();
      dioClient. Response response;
      var mData = {
        "password": newPassword,
        "confirmPassword": confirmPassword,
      };

      if (kDebugMode) {
        print("mData===$mData");
      }
      response = await AuthenticationServices()._dio.post(
        "api/auth/changePassword", // Replace with your actual endpoint URL
        data: mData,
        options: Options(contentType: "application/json"),
      );


      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (dioError) {
      EasyLoading.dismiss();
      if (dioError.response != null) {
        var data = dioError.response!.data;
        if (data['errors'] != null) {
          List<dynamic> errors = data['errors'];
          print("data===$data");
          String userErrorMessage = "";
          try {
            userErrorMessage = errors[0]['user'];
            print("userErrorMessage===$userErrorMessage");
          } catch (e) {}

          if (userErrorMessage.isNotEmpty) {
            Get.snackbar(
              'Validation Errors',
              '$userErrorMessage',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        } else {
          Get.snackbar(
            'Error',
            'Unknown validation error occurred.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }

        return null;
      } else {
        // Dio error without response, such as network issues
        Get.snackbar(
          'Network Error',
          'Failed to connect to the server.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return null;
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Error',
        'An unexpected error occurred.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  Future<dynamic> getProjectList() async {
    try {
      EasyLoading.show();
      dioClient.Response response;

      response = await _dio.get(
        "api/project",
        options: Options(contentType: "application/json"),
      );

      EasyLoading.dismiss();
      return response.data;
    } catch (e) {
      print(e);
      EasyLoading.dismiss();
    }
  }
}
