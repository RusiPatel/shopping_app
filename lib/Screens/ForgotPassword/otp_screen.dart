import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shopping_app/Utills/custom_widgets.dart';

import 'forgot_password.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  var otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Image.network(
            "https://img.freepik.com/free-vector/enter-otp-concept-illustration_114360-7897.jpg?w=360",
            height: 350,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          "Verify your OTP",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 100),
        Pinput(
          controller: otpController,
          onCompleted: (pin) => print(pin),
          defaultPinTheme: PinTheme(
            width: 56,
            height: 56,
            textStyle: const TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(30, 60, 87, 1),
                fontWeight: FontWeight.w600),
            decoration: BoxDecoration(
              color: const Color(0xff1C987E).withOpacity(0.4),
              border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          // validator: (value) {
          //   if (value!.isEmpty) {
          //     return ("Please enter the OTP.");
          //   }
          //   else if (value == "1234"){
          //     return "Please enter Valid OTP.";
          //   }
          //   else {
          //     return null;
          //   }
          // },
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () {},
            child: const Text(
              "Resend?",
              textAlign: TextAlign.end,
            )),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: InkWell(
            onTap: () {
              submitOTP();
            },
            child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff1C987E)),
                child: const Center(
                    child: Text(
                  "Verify",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ))),
          ),
        ),
      ],
    ));
  }

  submitOTP() {
    if (validateOtp()) {
      print(otpController.text);
      setState(() {});
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ForgotPassword()));
    }
  }

  bool validateOtp() {
    if (otpController.text.isEmpty) {
     CustomWidget().customErrorSnackBar(context: context, text: "Please enter otp");
      return false;
    } else if (otpController.text != "1234") {
      CustomWidget().customErrorSnackBar(context: context, text: "Please enter Valid OTP.");
      return false;
    } else {
      return true;
    }
  }
}
