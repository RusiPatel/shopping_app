import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/Controllers/login_controller.dart';
import 'package:shopping_app/Screens/ForgotPassword/email_screen.dart';
import 'package:shopping_app/Utills/custom_widgets.dart';

import 'create_account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // var _showPass = null;
  bool isLoading = false;

  // String email = "";
  // String password = "";
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                child: Image.network(
                  "https://d1whtlypfis84e.cloudfront.net/guides/wp-content/uploads/2019/07/31121724/fashion-1024x682.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: loginController.formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      const Text(
                        "Welcome Back!",
                        style: TextStyle(fontSize: 32),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: loginController.emailController,
                        decoration: CustomWidget().customInputDecoration(
                            hintText: 'Enter your Email address.'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => TextFormField(
                          controller: loginController.passwordController,
                          obscureText: loginController.showPass.value,
                          decoration: CustomWidget().customInputDecoration(
                            hintText: 'Enter your Password',
                            isSuffixVisible: true,
                            isPasswordVisible: loginController.showPass.value,
                            onSuffixTap: () {
                              loginController.showPass.value =
                                  !loginController.showPass.value;
                            },
                          ),
                          keyboardType: TextInputType.none,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const EmailScreen()));
                          },
                          child: Text(
                            "FORGOT PASSWORD?",
                            style: TextStyle(
                                color: Colors.black.withOpacity(
                                  0.7,
                                ),
                                fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                     Obx(() =>  loginController.isLoading.value
                          ? Center(
                              child: Lottie.network(
                                "https://assets3.lottiefiles.com/packages/lf20_T92TFZKmPr.json",
                                fit: BoxFit.cover,
                                height: 50,
                                width: 100,
                              ),
                            )
                          : CustomWidget().customButton(
                              text: "Login",
                              onButtonTap: () =>
                                  loginController.signIn(context: context))),
                      const SizedBox(height: 70),
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("don't have an account? ",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5))),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CreateAccount()));
                              },
                              child: const Text("CREATE ACCOUNT",
                                  style: TextStyle(color: Color(0xff1C987E))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -305,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 180,
              backgroundColor: const Color(0xff1C987E).withOpacity(0.4),
            ),
          )
        ],
      ),
    );
  }
}
