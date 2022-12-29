import 'package:get/get.dart';

class ProductList {
  List<ProductData>? data;

  ProductList({this.data});

  ProductList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  String? sId;
  String? imageURL;
  String? name;
  int? prize;
  double? rating;
  List<String>? size;
  RxBool? like;
  List<String>? user;
  String? producttype;
  String? time;
  int? iV;

  ProductData(
      {this.sId,
        this.imageURL,
        this.name,
        this.prize,
        this.rating,
        this.size,
        this.like,
        this.user,
        this.producttype,
        this.time,
        this.iV});

  ProductData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imageURL = json['imageURL'];
    name = json['name'];
    prize = json['prize'];
    rating = json['rating'];
    size = json['size'].cast<String>();
    like = json['like'] ? true.obs : false.obs;
    user = json['user'].cast<String>();
    producttype = json['producttype'];
    time = json['time'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['imageURL'] = this.imageURL;
    data['name'] = this.name;
    data['prize'] = this.prize;
    data['rating'] = this.rating;
    data['size'] = this.size;
    data['like'] = this.like;
    data['user'] = this.user;
    data['producttype'] = this.producttype;
    data['time'] = this.time;
    data['__v'] = this.iV;
    return data;
  }
}