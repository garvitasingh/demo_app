import 'dart:convert';

import 'package:demo_app/services/api_services.dart';
import 'package:demo_app/view/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class AuthController extends GetxController{

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final loading = false.obs;
  final agreeToPolicy = false.obs;

  Future<void> register(BuildContext context) async{
    loading.value = true;
    update();
    var data = {
      'full_name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'c_password': confirmPasswordController.text
    };

    try{
      var apiService = ApiService();
      var res = await apiService.postRequest(apiUrl:"register", data: data);
      loading.value = false;
      update();
      print(res);
      print(res["success"]);
      if (res['success']) {
        loading.value= false;
        showToast(context, res['message']);
        Get.to(OtpView(email: emailController.text,));
      }else {
        showToast(context, res['message']);
      }
    } catch (e) {
      print(e);
      showToast(context, 'An error occurred. Please try again.');
      loading.value = false;
      update();
    }
  }

  Future<void> verifyOtp(BuildContext context, String email) async{
    loading.value = true;
    update();
    var data = {
      'otp': otpController.text,
      'email': email
    };
print(data);
    try{
      var apiService = ApiService();
      var res = await apiService.postRequest(apiUrl: "verifyotp",data: data);
      loading.value = false;
      update();
      print(res);
      print(res["success"]);
      showToast(context, res['message']);
    } catch (e) {
      print(e);
      showToast(context, 'An error occurred. Please try again.');
      loading.value = false;
      update();
    }
  }

  void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.gradient2,
      ),
    );
  }
}