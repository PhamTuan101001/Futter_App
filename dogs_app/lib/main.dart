import 'package:dogs_app/src/auth_controller.dart';
import 'package:dogs_app/src/homePage.dart';
import 'package:dogs_app/src/login_page.dart';
import 'package:dogs_app/src/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dogs_app/src/signup_page.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((Value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(primaryColor: Colors.blue),
      home: LoginPage(),
    );
  }
}
