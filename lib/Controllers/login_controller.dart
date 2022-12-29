import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../Models/user_info.dart';
import '../Utills/custom_widgets.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final formkey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: "qwer@gmail.com");
  var passwordController = TextEditingController(text: "Qwer@123");
  var showPass = false.obs;


  signIn({required BuildContext context}) async {
    try {
      if (validateFields(context: context)) {
        isLoading.value = true;
        var response = await http
            .post(Uri.parse("http://192.168.29.195:8000/login"), body: {
          "email": emailController.text,
          "password": passwordController.text,
        }).timeout(const Duration(seconds: 2));
        isLoading.value = false;

        print("Body ::: ${response.body}");
        Map<String, dynamic> map = json.decode(response.body);
        if (response.statusCode == 200) {
          // print(response.statusCode);
          print(response.body);
          UserInfo userInfo = UserInfo.fromJson(map);
          // print(userInfo.email);
          // print(userInfo.password);
          GetStorage().write("isLogin", true);
          GetStorage().write("userData", userInfo.toJson());

          // prefs.setBool("isLogin", true);
          // prefs.setString("name", userInfo.name!);
          // prefs.setInt("mobileno", userInfo.mobileNo!);
          // prefs.setString("email", userInfo.email!);
          // prefs.setInt("gender", userInfo.gender!);

          Navigator.of(context).pushNamed('/');
        } else {
          isLoading.value = false;

          print("ERROR");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              duration: const Duration(milliseconds: 1000),
              behavior: SnackBarBehavior.floating, // Add this line,
              content: Text(map["message"])));
        }
      }
    } on TimeoutException catch (_) {
      isLoading.value = false;

    } catch (e) {
      rethrow;
    }
  }

  validateFields({required BuildContext context}) {
    var emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    var passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (emailController.text.isEmpty) {
      print(emailController.text);
      // CustomWidget()
      //     .customErrorSnackBar(context: context, text: "Please Enter Email.");
      Get.snackbar("Email", "Email is empty");
      return false;
    } else if (!emailRegex.hasMatch(emailController.text)) {
      print("object");
      CustomWidget().customErrorSnackBar(
          context: Get.context!, text: "Please Enter Valid Email.");
      return false;
    } else if (passwordController.text.isEmpty) {
      print(passwordController.text);
      CustomWidget().customErrorSnackBar(
          context: context, text: "Please Enter Password.");
      return false;
    } else if (!passwordRegex.hasMatch(passwordController.text)) {
      CustomWidget().customErrorSnackBar(
          context: context, text: "Please Enter Valid Password.");
    return false;
    }
    else{
      return true;
    }
  }
}
