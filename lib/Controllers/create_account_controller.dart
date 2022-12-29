import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../Models/user_info.dart';
import '../Models/user_inform.dart';
import '../Utills/constances.dart';

class CreateAccountController extends GetxController {
  var _formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phnoController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();
  GENDER _gender = GENDER.MALE;
  var isLoading = false.obs;

  register({required BuildContext context}) async {
    if (_formkey.currentState!.validate()) {
      print(nameController);
      print(phnoController);
      print(emailController.text);
      print(passwordController.text);
      print(confirmpasswordController.text);
      isLoading.value = true;
      var response = await http
          .post(Uri.parse("http://192.168.29.195:8000/adduser"), body: {
        "name": nameController.text,
        "gender": _gender == GENDER.MALE ? "0" : "1",
        "moblieno": phnoController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirmpassword": confirmpasswordController.text,
      });
      isLoading.value = false;
      print("Body ::: ${response.body}");
      Map<String, dynamic> map = json.decode(response.body);
      if (response.statusCode == 200) {
        UserInfo userInfo = UserInfo.fromJson(map);
        GetStorage().write("isLogin", true);
        GetStorage().write("userData", userInfo.toJson());

        // prefs.setBool("isLogin", true);
        // prefs.setString("name", userInfo.name!);
        // prefs.setInt("mobileno", userInfo.mobileNo!);
        // prefs.setString("email", userInfo.email!);
        // prefs.setInt("gender", userInfo.gender!);
        print("object");
        // print(response.statusCode);
        print(response.body);
        UserInform register = UserInform.fromJson(map);
        print(register.name);
        print(register.gender);
        print(register.moblieno);
        print(register.email);
        Navigator.of(context).pushNamed('/');
      } else {
        isLoading.value = false;

        print("ERROR");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red, content: Text(map["message"])));
      }
    }
  }
}
