import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Widget makePage({
  required String path,
  required Widget Function() page,
}) {
  final getPages = [
    GetPage(
      name: path,
      page: page,
    ),
    GetPage(
      name: '/any_route',
      page: () => Scaffold(
        appBar: AppBar(
          title: Text('any_title'),
        ),
        body: Text('fake page'),
      ),
    ),
  ];
  if (path != 'login') {
    getPages.add(
      GetPage(
        name: '/login',
        page: () => Scaffold(
          body: Text('fake login'),
        ),
      ),
    );
  }
  return GetMaterialApp(
    initialRoute: path,
    getPages: getPages,
  );
}

String get currentRoute => Get.currentRoute;
