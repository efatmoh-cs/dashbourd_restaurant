import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'add.dart';


class category extends StatefulWidget {

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  // var myprod = [
  //   {
  //     'pro_id': '1',
  //     "pro_name": 'cat1',
  //     "pro_price": 'cat1',
  //     "pro_image": 'images/cat1.png',
  //   },
  //   {
  //     'pro_id': '2',
  //     "pro_name": 'cat1',
  //     "pro_price": '100',
  //     "pro_image": 'images/cat1.png',
  //   },
  //   {
  //     'pro_id': '3',
  //     "pro_name": 'cat1',
  //     "pro_price": '200',
  //     "pro_image": 'images/cat1.png',
  //   },
  //   {
  //     'pro_id': '1',
  //     "pro_name": 'cat1',
  //     "pro_price": 'cat1',
  //     "pro_image": 'images/cat1.png',
  //   },
  //   {
  //     'pro_id': '1',
  //     "pro_name": 'cat1',
  //     "pro_price": 'cat1',
  //     "pro_image": 'images/cat1.png',
  //   },
  //   {
  //     'pro_id': '1',
  //     "pro_name": 'cat1',
  //     "pro_price": 'cat1',
  //     "pro_image": 'images/cat1.png',
  //   },
  //   {
  //     'pro_id': '1',
  //     "pro_name": 'cat1',
  //     "pro_price": 'cat1',
  //     "pro_image": 'images/cat1.png',
  //   },
  // ];
// List list=[];
// Future ReadData() async {
//   var url = 'http:// 192.168.1.2/flutter_restrant/library/function.php';
//   var res = await http.get(Uri.parse(uri));
//   if (res.statusCode == 200){
//     var red=jsonDecode(res.body);
//   }
  List data = [];


  fetchData() async {
    final response = await http.get(Uri.parse('http:// 192.168.43.68/flutter_restrant/library/function.php'));

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
      print(data);
    } else {
      throw Exception('Failed to load data');
    }
}

  // List list = [];
  // Future ReadData() async {
  //   var url = 'http://192.168.1.2/flutter_restrant/library/function.php';
  //   var res = await http.get(Uri.parse(url));
  //   if (res.statusCode == 200) {
  //     var red = json.decode(res.body);
  //     setState(() {
  //       list.addAll(red);
  //     });
  //     print(list);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getData();
  }
  getData()async{
    await fetchData();
  }


  //
  // fetchData() async {
  //   final response = await http.get(Uri.parse('http://192.168.1.2/flutter_restrant/library/function.php'));
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       data = json.decode(response.body);
  //     });
  //   } else {
  //     throw Exception('Failed to load data');
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('ادارة المطعم',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: 700,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return
                    ListTile(
                      title: Text('name'),

                        // list[index]['cat_name']
                      subtitle: Text('kind'),
                        // list[index]['cat_kind']
                    );
                //   SingleProduct(
                //   pro_id: myprod[index]['pro_id'],
                //   pro_image: myprod[index]['pro_image'],
                //   pro_name: myprod[index]['pro_name'],
                //   pro_price: myprod[index]['pro_price'],
                //   pro_opg: myprod[index]['pro_opg'],
                // );
              }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0, left: 1, right: 1),

        child: Container(height: 55,
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      // gradient: LinearGradient(     ///////line shadow white
                      //     begin: Alignment.topCenter,
                      //     end: Alignment.bottomCenter,
                      //     colors: <Color>[
                      //       Colors.yellow,
                      //       Colors.red, Colors.yellowAccent, Colors.red,
                      //     ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Container(

                        child: GestureDetector(
                          onTap: () {

                            Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Addcategory()));
                          },
                          child: Text("اضافه تصنيف جديد",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SingleProduct extends StatelessWidget {
//   final pro_id;
//   final pro_name;
//   final pro_image;
//   final pro_opg;
//   final pro_price;

  // const SingleProduct(
  //     {super.key,
  //       this.pro_id,
  //       this.pro_name,
  //       this.pro_image,
  //       this.pro_opg,
  //       this.pro_price});
  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     child: Column(
  //       children: [Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Container(alignment: Alignment.bottomLeft,child: Icon(
  //           Icons.cancel,
  //           color: Colors.red,
  //
  //           size: 25 ,),),
  //       ),
          // , Container(
          //   child: ListTile(
          //     title: Text(,
          //         style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 20,
          //             color: Colors.black)),
              // subtitle: Text(),
              // leading: Container(
              //   width: 50,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           // image: AssetImage(), fit: BoxFit.cover),
              //       shape: BoxShape.rectangle),
              // ),
              // trailing: Container(
              //   width: 50,
              //   child: Row(
              //     children: [
              //       GestureDetector(onTap: () {
              //
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (context) => Addcategory()));
              //       },
              //         child: Container(
              //           child: FaIcon(
              //             FontAwesomeIcons.edit,
              //             color: Colors.white,
              //             size: 25,
              //           ),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(3),
              //               color: Colors.cyan),
              //         ),
              //       ),




    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  // }
// }
