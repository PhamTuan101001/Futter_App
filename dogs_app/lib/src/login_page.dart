import 'package:dogs_app/src/auth_controller.dart';
import 'package:dogs_app/src/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('image/loginimg.png'),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   "HELLO",
                  //   style: TextStyle(
                  //       fontSize: 36,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black54),
                  // ),
                  // Text(
                  //   "Sign into your account",
                  //   style: TextStyle(
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.w200,
                  //       color: Colors.grey),
                  // ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(1, 1),
                              spreadRadius: 7,
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(1, 1),
                              spreadRadius: 7,
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Forgot your password?",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: h * 0.1,
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthController.instance.logIn(emailController.text.trim(),
                          passwordController.text.trim());
                    },
                    child: Container(
                      width: w * 0.5,
                      height: h * 0.08,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              image: AssetImage('image/loginbtn.png'),
                              fit: BoxFit.cover)),
                      child: const Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.15,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("don't have an account",
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  TextButton(
                      onPressed: () => Get.to(const SignupPage()),
                      child: const Text(
                        'Create',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ))
                ],
              ),
            )
          ]),
        ));
  }
}
