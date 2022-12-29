import 'package:flutter/material.dart';

class CustomWidget {
  customInputDecoration({
    required String hintText,
    bool isSuffixVisible = false,
    bool isPasswordVisible = false,
    Function()? onSuffixTap,
  }) {
    return InputDecoration(
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
        color: Color(0xff1C987E),
        width: 3,
      ),
      ),
      hintText: hintText,
      suffixIcon: isSuffixVisible
          ? InkWell(
              onTap: () => onSuffixTap!(),
              child: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xff1C987E),
              ))
          : const Text(""),
    );
  }

  customButton({
    Function()? onButtonTap,
    required String text,
  }) {
    return Center(
      child: InkWell(
        onTap: () => onButtonTap!(),
        child: Container(
          height: 50,
          width: 190,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color(0x701C987E).withOpacity(0.4),
                    offset: const Offset(2, 3),
                    blurRadius: 10.0,
                    spreadRadius: 2.0),
              ],
              color: const Color(0xff1C987E),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child:
                Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
      ),
    );
  }
  customErrorSnackBar({
    required BuildContext context,
    required String text,
  }){
    return ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.endToStart,
        elevation: 20,
        backgroundColor: Colors.red,
        content: Text(text,
          style: const TextStyle(fontSize: 15),
        )));

  }

}
