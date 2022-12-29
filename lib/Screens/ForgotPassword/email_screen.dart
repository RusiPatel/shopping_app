import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/Authentication/login_page.dart';
import 'package:shopping_app/Screens/ForgotPassword/otp_screen.dart';
import 'package:shopping_app/Utills/custom_widgets.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  var emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: 300,
              child: Image.network(
                "https://thumbs.dreamstime.com/b/frustrated-forgot-password-concept-question-marks-man-man-suffering-headache-86327948.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
              "Regenerate your Password !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              textAlign: TextAlign.center,
            )),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1C987E)),
                        borderRadius: BorderRadius.circular(32)),
                    hintText: "Enter your emailAddress"),
                controller: emailController,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                validateEmail();
              },
              child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff1C987E)),
                  child: Center(
                      child: Text(
                    "Send",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ))),
            ),
          ],
        ));
  }

  submitEmail() {
    if (validateEmail()) {
      print(emailController.text);
      setState(() {});
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  validateEmail() {
    var emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (emailController.text.isEmpty) {
      print(emailController.text);
      CustomWidget()
          .customErrorSnackBar(context: context, text: "Please Enter Email");
      setState(() {});
      return false;
    } else if (!emailRegex.hasMatch(emailController.text)) {
      CustomWidget().customErrorSnackBar(
          context: context, text: "Please Enter Valid Email");
      return false;
    } else {
      return true;
    }
  }
}
