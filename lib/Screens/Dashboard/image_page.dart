import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Models/product_list.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key, required this.wear}) : super(key: key);
  final ProductData wear;

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  PageController? controller;
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ Container(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.wear.imageURL!,              height: 400,
              fit: BoxFit.cover,
            )),
          // PageView(
          //     controller: controller,
          //     scrollDirection: Axis.horizontal,
          //     children: widget.wear.imageURL!
          //         .map(
          //           (images) => Container(
          //               width: MediaQuery.of(context).size.width,
          //               child: Image.network(
          //                 images,
          //                 height: 400,
          //                 fit: BoxFit.cover,
          //               )),
          //         )
          //         .toList()),
          Positioned(
              top: 40,
              left: 20,
              child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(child: Icon(Icons.arrow_back))))
        ],
      ),
    );
  }
}
