class BannerImageModels {
  WearData? data;

  BannerImageModels({this.data});

  BannerImageModels.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new WearData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class WearData {
  List<String>? woman;
  List<String>? men;
  List<String>? kid;

  WearData({this.woman, this.men, this.kid});

  WearData.fromJson(Map<String, dynamic> json) {
    woman = json['woman'].cast<String>();
    men = json['men'].cast<String>();
    kid = json['kid'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['woman'] = this.woman;
    data['men'] = this.men;
    data['kid'] = this.kid;
    return data;
  }
}
