import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    List image = ['g.png', 't.png', 'f.png'];
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
                      image: AssetImage('image/signup.png'),
                      fit: BoxFit.cover)),
              child: Column(children: [
                SizedBox(
                  height: h * 0.14,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 55,
                  backgroundImage: AssetImage('image/profile.png'),
                )
              ]),
            ),
            SizedBox(
              height: h * 0.05 + 10,
            ),
            Container(
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  SizedBox(
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
                  SizedBox(
                    height: h * 0.1,
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthController.instance.register(
                          emailController.text.trim(),
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
                          'Sign up',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () => Get.back(),
                      child: Text('Have an account.',
                          style: TextStyle(color: Colors.grey, fontSize: 16))),
                  SizedBox(
                    height: h * 0.07,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'Sigin up using one of the following methods',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Wrap(
                    children: List<Widget>.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(5),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey,
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundImage:
                                      AssetImage('image/' + image[index]),
                                ),
                              ),
                            )),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
