import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your Bag",style: TextStyle(color: Colors.orangeAccent,fontSize: 32,fontWeight: FontWeight.bold)),
                 SizedBox(height: 30),
                 CircleAvatar(backgroundImage: NetworkImage("https://cdn3.vectorstock.com/i/1000x1000/62/87/flat-design-shopping-cart-vector-13576287.jpg")
                 ,radius: 150,)
              ],
            ),
          ),
        ));
  }
}
