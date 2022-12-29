import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopping_app/Models/product_list.dart';

import '../Models/user_info.dart';

class ProductPageController extends GetxController {
  var isLoading = false.obs;
  var selectedSizeIndex = 0.obs;


  like({
    BuildContext? context,
    ProductData? product,
  }) async {
    isLoading.value = true;
    Map<String, dynamic> mapp =
        GetStorage().read("userData") as Map<String, dynamic>;
    print(mapp);
    UserInfo userInfo = UserInfo.fromJson(mapp);

    var response = await http
        .post(Uri.parse("http://192.168.29.195:8000/likeanddislike"), body: {
      "userid": userInfo.sId,
      "productid": product!.sId
    }).timeout(const Duration(seconds: 2));
    isLoading.value = false;
    print("Body ::: ${response.body}");
    Map<String, dynamic> map = json.decode(response.body);
    if (response.statusCode == 200) {
      // print(response.statusCode);
      print(response.body);
      product.like!.value = !product.like!.value;
    } else {
      isLoading.value = false;
      print("ERROR");
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating, // Add this line,
          content: Text(map["message"])));
    }
  }
}
