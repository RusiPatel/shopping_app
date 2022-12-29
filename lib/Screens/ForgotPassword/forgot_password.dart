import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
    Image.network("https://images.squarespace-cdn.com/content/v1/5d389f4db3dd700001884a93/1587171353374-5GB1KLV4UZCU98QCWZS4/image-asset.jpeg?format=1500w",
    height: 300,
    )
    );
  }
}