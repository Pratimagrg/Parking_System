import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/routes.dart';
import 'package:parkingsystem/views/screens/entry.dart';
import 'package:parkingsystem/views/screens/home.dart';
import 'package:parkingsystem/views/screens/login.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: GetRoutes.login,
    getPages: GetRoutes.routes,
  ));
}
