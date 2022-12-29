import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import '../Models/banner_image_model.dart';
import '../Models/product_list.dart';

class HomePageController extends GetxController {
  var isLoading = false;
  List<ProductData> womenproductData = <ProductData>[].obs;
  List<ProductData> menproductData = <ProductData>[].obs;
  List<ProductData> kidproductData = <ProductData>[].obs;
  var bannerImages = BannerImageModels().obs;

  void shoppingData() async {
    isLoading = true;
    var response =
        await http.get(Uri.parse("http://192.168.29.195:8000/woman"));
    print("::: ${response.body}");
    if (response.statusCode == 200) {
      ProductList productList =
          ProductList.fromJson(json.decode(response.body));
      womenproductData.addAll(productList.data!);
      print("::: WOMAN ${response.body}");
    } else {
      isLoading = false;
      print("Women Error");
    }
    var res = await http.get(Uri.parse("http://192.168.29.195:8000/men"));
    print("::: ${res.body}");
    if (res.statusCode == 200) {
      ProductList productList = ProductList.fromJson(json.decode(res.body));
      menproductData.addAll(productList.data!);
      print("::: MEN ${res.body}");
    } else {
      isLoading = false;

      print("Men Error");
    }
    var respond = await http.get(Uri.parse("http://192.168.29.195:8000/kids"));
    print("::: ${respond.body}");
    isLoading = false;
    if (respond.statusCode == 200) {
      ProductList productList = ProductList.fromJson(json.decode(respond.body));
      kidproductData.addAll(productList.data!);
      print("::: KIDS ${respond.body}");
    } else {
      isLoading = false;
      print("Kid Error");
    }
  }

  getMenData() {}

  void addImages() async {
    isLoading = true;

    var response =
        await http.get(Uri.parse("http://192.168.29.195:8000/bannerImages"));
    print("::: ${response.body}");
    isLoading = false;
    if (response.statusCode == 200) {
      bannerImages.value =
          BannerImageModels.fromJson(json.decode(response.body));

      print(response.body);
    } else {
      isLoading = false;
      print("Error");
    }
  }
}
