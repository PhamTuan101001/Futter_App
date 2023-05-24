import 'package:dogs_app/src/auth_controller.dart';
import 'package:dogs_app/src/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  String email;
  WelcomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  backgroundImage: AssetImage('image/profile1.png'),
                )
              ]),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.3,
            ),
            GestureDetector(
              onTap: () {
                AuthController.instance.logOut();
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
                    'Sign out',
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.red.shade600,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Get.to(() => HomePage(
                      email: email,
                    ));
              },
              icon: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
