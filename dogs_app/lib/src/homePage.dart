import 'dart:math';
import 'package:dogs_app/src/auth_controller.dart';
import 'package:dogs_app/src/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomePage extends StatefulWidget {
  String email;
  HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;
  var breeds;
  var selectedBreed = 'affenpinscher';

  List<String> items = [
    'affenpinscher',
    'african',
    'airedale',
    'akita',
    'appenzeller',
    'basenji',
    'beagle',
    'bluetick',
    'borzoi',
    'bouvier',
    'boxer',
    'brabancon',
    'coonhound',
    'cotondetulear',
    'dalmatian',
    'dingo',
    'eskimo',
    'groenendael',
    'havanese',
    'husky',
    'komondor',
    'maltese',
    'puggle',
    'sharpei',
    'shiba',
  ];

  Future apically() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://dog.ceo/api/breed/$selectedBreed/images/random'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        breeds = data['message'];
      });
    } else {
      print('Lỗi ${response.statusCode}');
    }
  }

  @override
  void initState() {
    apically();
    super.initState();
  }

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
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Breeds List',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                  child: SizedBox(
                width: w * 0.5,
                child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.amberAccent,
                                style: BorderStyle.solid))),
                    dropdownColor: Colors.grey.shade200,
                    value: selectedBreed,
                    items: items
                        .map(((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            )))
                        .toList(),
                    onChanged: (e) => setState(() {
                          selectedBreed = e.toString();
                        })),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: h * 0.3,
              width: w * 0.8,
              color: Colors.amberAccent,
              child: breeds == null
                  ? const Center(
                      child: Text(
                      'data is loading',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ))
                  : Image.network(breeds.toString()),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (() {
                apically();
              }),
              child: Text('Ramdom Image'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red.shade600, shape: StadiumBorder()),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red.shade600,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Get.to(() => WelcomePage(email: '${widget.email}'));
              },
              icon: Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
