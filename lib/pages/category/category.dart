import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'add.dart';

class product extends StatefulWidget {
  const product({super.key});

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {


  // List to hold data fetched from the server
  List products = [];

  // Function to fetch data from PHP API
  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://192.168.43.68/flutter_restrant/library/fetchcategory.php'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمه الصنيفات'),
        backgroundColor: Colors.red,
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loader if data is not fetched yet
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['cat_name']),
             subtitle: Text(products[index]['cat_kind']),
          );
        },
      )
        ,bottomNavigationBar: Padding(
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




// Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Container(
      //     // height: 700,
      //     width: MediaQuery.of(context).size.width,
      //     child: ListView.builder(
      //         // itemCount: data!.length,
      //         // itemBuilder: (BuildContext context,  int index) {
      //         //   return
      //         //     ListTile(
      //         //         title: Text('data'),
      //         //         leading: InkWell(onTap: (){
      //         //     // getImg(snap.data![index]['use_id']);
      //         //   },
      //         //   child: CircleAvatar(radius: 20,
      //         //   // foregroundImage: NetworkImage('http://192.168.43.68/flutter_restrant/library/${snap.data![index]['image']}'),
      //         //   child: Text( 'data2'))));
      //
      //
      //           itemCount: data.length,
      //         itemBuilder: (BuildContext context,index ) {
      //           return
      //               ListTile(
      //                 title: Text('ASASA'),////////////////
      //                 // (data[index]['cat_name'].toString()
      //                   // list[index]['cat_name']
      //                 subtitle: Text('data'),///////////////////
      //                   // data[index]['cat_kind']
      //              );
      //           //   SingleProduct(
      //           //   pro_id: myprod[index]['pro_id'],
      //           //   pro_image: myprod[index]['pro_image'],
      //           //   pro_name: myprod[index]['pro_name'],
      //           //   pro_price: myprod[index]['pro_price'],
      //           //   pro_opg: myprod[index]['pro_opg'],
      //           // );
      //            }),
      //   ),
      // ),
      //






////////////////////////////////////////////////////////////////////////



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
