import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping_app/Models/user_info.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name;
  int? mobileNo;
  String? email;
  int? gender;

  @override
  void didChangeDependencies() async {
    Map<String, dynamic> map =
        GetStorage().read("userData") as Map<String, dynamic>;
    UserInfo userInfo = UserInfo.fromJson(map);

    name = userInfo.name! ?? "";
    mobileNo = userInfo.mobileNo ?? 0;
    email = userInfo.email ?? "";
    gender = userInfo.gender! ?? 0;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(color: Colors.black),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Profile",
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                    ),
                    radius: 150,
                  ),
                  SizedBox(height: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: $name" ?? "",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "MobileNo: $mobileNo",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Email: $email",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        " Gender:${gender == 0 ? " Male" : " Female"}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
