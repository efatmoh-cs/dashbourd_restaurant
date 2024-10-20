import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../home.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController name=TextEditingController();
  TextEditingController mobile=TextEditingController();

  get http => null;

  Future<void> loginUser(String name, String mobile) async {
    final url = 'http://192.168.43.68/flutter_restrant/library/login.php'; // Replace with your PHP backend URL

    final response = await http.post(
      Uri.parse(url),
      body: {
        'name': name,
        'mobile': mobile,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData['status'] == 'success') {
        // Login successful, navigate to another screen or show success
        print('Login successful');
      } else {
        // Login failed, show error message
        print('Login failed: ${responseData['message']}');
      }
    } else {
      print('Error: ${response.statusCode}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 25,
            color: Colors.black,
          ),
          backgroundColor: Colors.white70,
          elevation: 0,
        ),
        body:
        Directionality(textDirection: TextDirection.rtl,
          child: Column(
            children: [    Container(
              child: Expanded(
                child: Form(
                    child: ListView(children: [
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("سجل الدخول الى حسابك من هنا",
                                // textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                          )),

                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:  Color.fromRGBO(209, 209, 220,
                                    1.0),),
                              margin: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: TextFormField(textAlign: TextAlign.right,
                                  controller: name,
                                  decoration: InputDecoration(
                                    hintText: 'الاسم بالكامل',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                              )
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(209, 209, 220, 1.0),
                            ),
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(textAlign: TextAlign.right,
                                      controller: mobile,
                                      decoration: InputDecoration(
                                        hintText: 'كلمه المرور',
                                        border: InputBorder.none,
                                      ),
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter an email address';
                                      //   }
                                      //   final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                      //   if (!emailRegex.hasMatch(value)) {
                                      //     return 'الرجاء ادخال البريد الالكتروني';
                                      //   }
                                      //   return null;
                                      // },
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          )
                      ),


                      MaterialButton(
                        onPressed: () {
                          print(name.text);
                          print(mobile.text);
                          // Navigator.pushReplacement(context,
                          //     MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                            child: Text(
                              'دخول',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ])
                ),

              ),


            ),

            ],
          ),
        ));
  }
}



