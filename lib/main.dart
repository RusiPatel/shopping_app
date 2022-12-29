import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping_app/Screens/Authentication/login_page.dart';
import 'package:shopping_app/Screens/Dashboard/dashboard.dart';

import 'Models/user_info.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: GetStorage().read("isLogin") ?? false ? '/' : 'login_page',
      routes: {
        '/': (context) => Dashboard(),
        'login_page': (context) => LoginPage(),
      },
    );
  }
}
