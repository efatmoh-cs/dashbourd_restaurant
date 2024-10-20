import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;


import '../home.dart';

class Addcategory extends StatefulWidget {
  const Addcategory({super.key});

  @override
  State<Addcategory> createState() => _AddcategoryState();
}

class _AddcategoryState extends State<Addcategory> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _kindController = TextEditingController();

////////////////////////add data///////////////
  Future<void> _insertData() async {
    final String name = _nameController.text;
    final String kind = _kindController.text;

    final response = await http.post(
      Uri.parse('https://192.168.43.68/flutter_restrant/library/send.php'), // Replace with your server's URL
      body: {
        'name': name,
        'kind': kind,
      },
    );

    final data = json.decode(response.body);

    if (data['success']) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data['message']),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data['message']),
      ));
    }
  }



  final _phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('اضافة تصنيف جديد'),centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 25,
            color: Colors.black,
          ),
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Container(
                child: Expanded(
                  child: Form(
                      child: ListView(children: [


                        Padding(
                            padding: const EdgeInsets.all(10),
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
                                  child: TextFormField(controller: _nameController,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      hintText: 'اسم التصنيف',
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ))),

                        Padding(
                            padding: const EdgeInsets.all(10),
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
                                child: TextFormField(controller: _kindController,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(

                                      hintText: 'السم بالانجليزي',
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a phone number';
                                      } else if (!_phoneRegExp.hasMatch(value)) {
                                        return 'Please enter a valid phone number';
                                      }
                                      return null;
                                    }),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 20,
                              left: 10,
                              right: 10,
                            ),
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
                                child: TextFormField(
                                  textAlign: TextAlign.right,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'الترتيب',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            )),
                        MaterialButton(
                          onPressed: () {print(_nameController.text);
                          print(_kindController.text);
                          _insertData();
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => Login()));
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.only(top: 20, left: 8, right: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red,
                              ),
                              child: Text(
                                'حفظ',
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

                      ])),
                ),
              ),

            ],
          ),
        ));
  }
}
