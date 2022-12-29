import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shopping_app/Controllers/create_account_controller.dart';
import 'package:shopping_app/Models/user_info.dart';
import 'package:shopping_app/Models/user_inform.dart';
import 'package:shopping_app/Screens/Dashboard/dashboard.dart';
import 'package:shopping_app/Screens/Dashboard/product_page.dart';

import '../../Utills/constances.dart';
import '../../Utills/custom_widgets.dart';
import 'login_page.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var _formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phnoController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();
  var _passwordVisible = false;
  GENDER _gender = GENDER.MALE;
  var isLoading = false;
  CreateAccountController createAccountController =
      Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                "https://media.istockphoto.com/id/1073935306/photo/girls-carrying-shopping-bags.jpg?s=612x612&w=0&k=20&c=JB-TrME32dc0VTnaXVxsbJIExZqR71m-iyVOnG-7puM=",
                height: 300,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 45,
                  left: 25,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 22,
                      ))),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Get Started.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "Already have an account?   ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff1C987E)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: nameController,
                        decoration: CustomWidget().customInputDecoration(
                            hintText: "What do people calls you ?"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter your name.";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Row(children: [
                        Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xff1C987E)),
                            value: GENDER.MALE,
                            groupValue: _gender,
                            onChanged: (value) {
                              _gender = value!;
                              setState(() {});
                            }),
                        Text("MALE",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 15),
                        Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xff1C987E)),
                            value: GENDER.FEMALE,
                            groupValue: _gender,
                            onChanged: (value) {
                              _gender = value!;
                              setState(() {});
                            }),
                        Text("FEMALE",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: phnoController,
                        maxLength: 10,
                        decoration: CustomWidget().customInputDecoration(
                            hintText: "Your Contact number ?"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter your Phone Number.";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: CustomWidget().customInputDecoration(
                            hintText: "Write your valid email Address."),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          var emailRegex = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (value!.isEmpty) {
                            return "Please Enter your email address.";
                          } else if (!emailRegex.hasMatch(value)) {
                            return "Please enter Valid Email Address.";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: _passwordVisible,
                        controller: passwordController,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xff1C987E),
                            width: 3,
                          )),
                          hintText: "Password at least 8 characters",
                          suffixIcon: InkWell(
                              onTap: () {
                                _passwordVisible = !_passwordVisible;
                                setState(() {});
                              },
                              child: Icon(
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Theme.of(context).primaryColorDark,
                              )),
                        ),
                        validator: (value) {
                          RegExp passwordRegex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value!.isEmpty) {
                            return "Please create your password.";
                          } else if (!passwordRegex.hasMatch(value)) {
                            return "Please enter Valid Email Address.";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                          obscureText: _passwordVisible,
                          controller: confirmpasswordController,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Color(0xff1C987E),
                              width: 3,
                            )),
                            hintText:
                                "ConfirmPassword must be same as Password",
                            suffixIcon: InkWell(
                                onTap: () {
                                  _passwordVisible = !_passwordVisible;
                                  setState(() {});
                                },
                                child: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).primaryColorDark,
                                )),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please create your password.";
                            } else if (passwordController.text != value) {
                              return "Confirm Password must be same as Password";
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
              )),
          CustomWidget().customButton(
            text: "Sign Up",
            onButtonTap: () => createAccountController.isLoading.value
                ? Center(
              child: Lottie.network(
                "https://assets3.lottiefiles.com/packages/lf20_T92TFZKmPr.json",
                fit: BoxFit.cover,
                height: 50,
                width: 100,
              ),
            )
                : createAccountController.register(context: context),
          ),
        ],
      ),
    ));
  }
}
