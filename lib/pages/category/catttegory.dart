
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'add.dart';


import 'dart:convert'; // To handle JSON data
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // For making HTTP requests

class Catttegory extends StatefulWidget {
  const Catttegory({super.key});

  @override
  State<Catttegory> createState() => _CatttegoryState();
}

class _CatttegoryState extends State<Catttegory> {


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
        title: Text('Product List'),
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loader if data is not fetched yet
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['use_name']),
            // subtitle: Text('Price: ${products[index]['price']}'),
          );
        },
      ),
    );
  }
}

