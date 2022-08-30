import 'package:assignment_nayab/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Home/HomeBinding.dart';
import 'Home/HomeScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const HomeScreen(),
      initialBinding: HomeBinding(),
      getPages: [

        GetPage(
            name:  Routes.routeHome,
            page: () => const HomeScreen(),
            binding: HomeBinding()),

      ], );
  }
}

