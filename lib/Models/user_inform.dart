class UserInform {
  String? id;
  String? name;
  int? moblieno;
  String? email;
  int? gender;

  UserInform({this.id, this.name, this.moblieno, this.email, this.gender});

  UserInform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    moblieno = json['moblieno'];
    email = json['email'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['moblieno'] = this.moblieno;
    data['email'] = this.email;
    data['gender'] = this.gender;
    return data;
  }
}