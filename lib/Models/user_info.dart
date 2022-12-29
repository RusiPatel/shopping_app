class UserInfo {
      String? name;
      String? email;
      String? password;
      String? sId;
      int? mobileNo;
      int? iV;
      int? gender;

      UserInfo({this.gender,this.email, this.password, this.sId, this.iV,this.name,this.mobileNo});

      UserInfo.fromJson(Map<String, dynamic> json) {
            email = json['email'];
            password = json['password'];
            sId = json['_id'];
            iV = json['__v'];
            name = json['name'];
            mobileNo = json['moblieno'];
            gender = json['gender'];
      }

      Map<String, dynamic> toJson() {
            final Map<String, dynamic> data = new Map<String, dynamic>();
            data['email'] = this.email;
            data['password'] = this.password;
            data['_id'] = this.sId;
            data['__v'] = this.iV;
            data['name'] = this.name;
            data['moblieno'] = this.mobileNo;
            data['gender'] = this.gender;
            return data;
      }
}
