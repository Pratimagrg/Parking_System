import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti/khalti.dart';
import 'package:parkingsystem/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Khalti.init(
    publicKey: 'test_public_key_2818029cc929443fb79a54d279aa8d2a',
    enabledDebugging: false,
  );
  runApp(GetMaterialApp(
    initialRoute: GetRoutes.login,
    getPages: GetRoutes.routes,
  ));
}
