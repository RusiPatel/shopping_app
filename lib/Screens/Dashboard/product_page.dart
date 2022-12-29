
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_app/Controllers/product_page_controller.dart';
import 'package:shopping_app/Models/product_list.dart';

import 'package:shopping_app/Utills/custom_widgets.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);
  final ProductData product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  PageController? controller;
  ProductPageController productPageController = Get.put(ProductPageController());


  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      widget.product.imageURL!,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // PageView(
                  //     controller: controller,
                  //     scrollDirection: Axis.horizontal,
                  //     children: widget.product.imageURL!
                  //         .map(
                  //           (images) => InkWell(
                  //             onTap: () {
                  //               Navigator.of(context).push(MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       ImagePage(wear: widget.product)));
                  //             },
                  //             child: Container(
                  //                 width: MediaQuery.of(context).size.width,
                  //                 child: Image.network(
                  //                   images,
                  //                   height: 400,
                  //                   fit: BoxFit.cover,
                  //                 ),),
                  //           ),
                  //         )
                  //         .toList()),
                  Positioned(
                    top: 52,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 52,
                    right: 10,
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/7887/7887573.png",
                          fit: BoxFit.cover,
                          height: 20,
                          width: 20,
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(widget.product.name!,
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 50),
                      Text(widget.product.prize!.toString(),
                          style: const TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xff1C987E),
                        size: 32,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.product.rating!.toString(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4), fontSize: 25),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "SIZE",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7), fontSize: 20),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      Container(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: widget.product.size!.length,
                          itemBuilder: (context, index) => Ink(
                            child: Obx(
                                () => Container(
                                height:  productPageController.selectedSizeIndex.value  == index
                                    ? (9.33 *
                                            double.parse(
                                                productPageController.selectedSizeIndex.value .toString()) +
                                        60)
                                    : 40,
                                width:  productPageController.selectedSizeIndex.value  == index ? 60 : 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:  productPageController.selectedSizeIndex.value  == index
                                      ? Color(0xff1C987E)
                                      : Color(0xff1C987E).withOpacity(0.4),
                                ),
                                child: InkWell(
                                  onTap: () {
                                        productPageController.selectedSizeIndex.value = index ;
                                  },
                                  child: sizeContainer(
                                    text: widget.product.size![index],
                                    color:
                                        const Color(0xff1C987E).withOpacity(0.1),
                                    textcolor:  productPageController.selectedSizeIndex.value  == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontweight:  productPageController.selectedSizeIndex.value  == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize:
                                    productPageController.selectedSizeIndex.value  == index ? 20 : 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(width: 25),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Obx(
                        () =>  InkWell(
                            onTap: () {
                              productPageController.like(context: context,product: widget.product);
                            },
                            child: widget.product.like!.value
                                ? Icon(
                                    Icons.favorite_outline_sharp,
                                    size: 40,
                                    color: Colors.black.withOpacity(0.6),
                                  )
                                : const Icon(
                                    Icons.favorite,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20)),
                        Icon(Icons.perm_identity_sharp,
                            size: 40, color: Colors.black.withOpacity(0.6)),
                        const Spacer(),
                        InkWell(
                            splashColor: Colors.black,
                            onTap: () {
                              print("object");
                            },
                            child: CustomWidget().customButton(
                                text: "Add to Cart", onButtonTap: () {}))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container sizeContainer(
      {required String text,
      required Color color,
      required Color textcolor,
      required FontWeight fontweight,
      required double fontSize}) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
      height: 40,
      width: 40,
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: textcolor, fontWeight: fontweight, fontSize: fontSize),
      )),
    );
  }


}
