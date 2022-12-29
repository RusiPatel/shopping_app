import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Offers",style: TextStyle(color: Colors.orangeAccent,fontSize: 32,fontWeight: FontWeight.bold)),
SizedBox(height: 30,),
              CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage("https://thumbs.dreamstime.com/b/special-offer-price-tag-sign-paper-against-rustic-red-painted-barn-wood-55863934.jpg",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
