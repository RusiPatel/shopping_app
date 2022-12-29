class LikeModel {
  String? sId;
  String? imageURL;
  String? name;
  int? prize;
  double? rating;
  String? size;
  bool? like;
  String? producttype;

  LikeModel(
      {this.sId,
        this.imageURL,
        this.name,
        this.prize,
        this.rating,
        this.size,
        this.like,
        this.producttype});

  LikeModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imageURL = json['imageURL'];
    name = json['name'];
    prize = json['prize'];
    rating = json['rating'];
    size = json['size'];
    like = json['like'];
    producttype = json['producttype'];
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
    data['producttype'] = this.producttype;
    return data;
  }
}